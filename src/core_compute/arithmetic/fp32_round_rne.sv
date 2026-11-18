
`timescale 1ns/1ps

module fp32_round_rne (

    input  logic               valid_in,
    input  logic               sign_in,
    input  logic signed [10:0] exponent_in,

    input  logic [23:0]        significand_in,

    input  logic               guard_in,
    input  logic               round_in,
    input  logic               sticky_in,

    input  logic               is_zero_in,

    output logic               valid_out,
    output logic [31:0]        fp32_out

);

    logic [26:0] extended_sig;
    logic [26:0] shifted_sig;

    // 25 bits are required to preserve rounding carry.
    logic [24:0] rounded_ext;

    logic [23:0] rounded_sig;

    logic [7:0] exponent_field;

    logic guard_bit;
    logic round_bit;
    logic sticky_bit;

    logic round_increment;

    integer signed adjusted_exponent;
    integer shift_amount;

    // ------------------------------------------------
    // Right shift with sticky-bit preservation.
    // ------------------------------------------------

    function automatic logic [26:0] shift_right_jam (
        input logic [26:0] value,
        input integer amount
    );

        logic sticky;
        logic [26:0] shifted;
        integer j;

        begin

            sticky = 1'b0;
            shifted = 27'd0;

            if (amount <= 0) begin

                shift_right_jam = value;

            end
            else if (amount >= 27) begin

                shift_right_jam = {
                    26'd0,
                    (|value)
                };

            end
            else begin

                shifted = value >> amount;

                for (j = 0; j < 27; j = j + 1) begin

                    if (j < amount)
                        sticky = sticky | value[j];

                end

                shifted[0] = shifted[0] | sticky;

                shift_right_jam = shifted;

            end

        end

    endfunction

    // ------------------------------------------------
    // FP32 Round-to-Nearest, Ties-to-Even.
    // ------------------------------------------------

    always_comb begin

        valid_out = valid_in;
        fp32_out = 32'd0;

        extended_sig = 27'd0;
        shifted_sig = 27'd0;

        rounded_ext = 25'd0;
        rounded_sig = 24'd0;

        exponent_field = 8'd0;

        guard_bit = 1'b0;
        round_bit = 1'b0;
        sticky_bit = 1'b0;

        round_increment = 1'b0;

        adjusted_exponent = $signed(exponent_in);
        shift_amount = 0;

        if (valid_in) begin

            // ----------------------------------------
            // Preserve signed zero.
            // ----------------------------------------

            if (is_zero_in || significand_in == 24'd0) begin

                fp32_out = {
                    sign_in,
                    31'd0
                };

            end
            else begin

                // ------------------------------------
                // Build significand + GRS field.
                // ------------------------------------

                extended_sig = {
                    significand_in,
                    guard_in,
                    round_in,
                    sticky_in
                };

                shifted_sig = extended_sig;

                // ------------------------------------
                // Convert underflow-range values into
                // the FP32 subnormal representation.
                // ------------------------------------

                if (adjusted_exponent < -126) begin

                    shift_amount = -126 - adjusted_exponent;

                    shifted_sig = shift_right_jam(
                        extended_sig,
                        shift_amount
                    );

                    adjusted_exponent = -126;

                end

                // ------------------------------------
                // Extract retained significand and GRS.
                // ------------------------------------

                guard_bit = shifted_sig[2];
                round_bit = shifted_sig[1];
                sticky_bit = shifted_sig[0];

                // ------------------------------------
                // Round to nearest, ties to even.
                // ------------------------------------

                round_increment =
                    guard_bit &&
                    (
                        round_bit ||
                        sticky_bit ||
                        shifted_sig[3]
                    );

                // ------------------------------------
                // IMPORTANT:
                // Use 25-bit addition to preserve carry.
                // ------------------------------------

                rounded_ext = {
                    1'b0,
                    shifted_sig[26:3]
                };

                if (round_increment)
                    rounded_ext = rounded_ext + 25'd1;

                // ------------------------------------
                // Normalize rounding carry.
                // ------------------------------------

                if (rounded_ext[24]) begin

                    rounded_sig = rounded_ext[24:1];

                    adjusted_exponent =
                        adjusted_exponent + 1;

                end
                else begin

                    rounded_sig = rounded_ext[23:0];

                end

                // ------------------------------------
                // Handle exponent overflow.
                // ------------------------------------

                if (adjusted_exponent > 127) begin

                    fp32_out = {
                        sign_in,
                        8'hFF,
                        23'd0
                    };

                end
                else if (rounded_sig == 24'd0) begin

                    // Preserve signed zero after underflow.

                    fp32_out = {
                        sign_in,
                        31'd0
                    };

                end
                else begin

                    // --------------------------------
                    // Normal result.
                    // --------------------------------

                    if (rounded_sig[23]) begin

                        exponent_field =
                            adjusted_exponent + 127;

                        fp32_out = {
                            sign_in,
                            exponent_field,
                            rounded_sig[22:0]
                        };

                    end

                    // --------------------------------
                    // Subnormal result.
                    // --------------------------------

                    else begin

                        exponent_field = 8'd0;

                        fp32_out = {
                            sign_in,
                            exponent_field,
                            rounded_sig[22:0]
                        };

                    end

                end

            end

        end

    end

endmodule
