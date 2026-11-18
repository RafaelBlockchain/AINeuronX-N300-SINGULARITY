
# N300 — N200 Arithmetic Reference and Transfer Audit

- Document ID: N300-ARITH-REF-001
- Version: 0.1
- Status: ENGINEERING AUDIT
- Source: AINeuronX-NeuronOS
- Target: AINeuronX N300 SINGULARITY

## 1. Purpose

This document records the arithmetic modules inspected in the N200 repository and establishes their potential use as engineering references for N300.

N200 RTL is not automatically approved for N300 integration.

Every transferred module must pass independent functional, numerical, timing, and architectural verification.

## 2. Inspected Modules

| Module | Function | Classification |
|---|---|---|
| int16_mac.sv | Signed INT16 multiply-accumulate | REUSABLE AS REFERENCE |
| fp16_to_fp32.sv | FP16 conversion | REUSE AFTER VALIDATION |
| fp8_to_fp32.sv | FP8 conversion | REUSE AFTER VALIDATION |
| fp32_classify.sv | FP32 classification | REUSABLE AS REFERENCE |
| fp32_multiplier.sv | FP32 multiplication | UPGRADE / REWORK |
| fp32_align_add.sv | FMA alignment and addition | UPGRADE / REWORK |
| fp32_normalize.sv | FP32 normalization | UPGRADE / REWORK |
| fp32_round_rne.sv | Round-to-nearest-even | UPGRADE / REWORK |
| fp32_fma.sv | FP32 fused multiply-add | REBUILD |

## 3. Important Findings

### 3.1 INT16 MAC

The N200 implementation performs signed INT16 multiplication and accumulation using a 35-bit accumulator.

The module provides a useful reference for:

- Signed multiplication.
- Sign extension.
- Accumulator behavior.
- Valid signaling.
- Synchronous accumulator clearing.
- Reset behavior.

Overflow semantics must be explicitly defined for N300.

### 3.2 FP32 FMA

The existing fp32_fma.sv file is incomplete.

It contains a module interface without an operational implementation.

It must not be treated as a functional arithmetic unit.

N300 requires an independently implemented and verified FMA datapath.

### 3.3 FP32 Rounding

The current RNE implementation requires correction and verification of significand carry propagation.

Rounding overflow must correctly update the exponent and handle the transition to infinity.

### 3.4 FP32 Multiplication

Special-value classification is present.

The complete arithmetic pipeline must explicitly handle:

- Zero multiplied by infinity.
- NaN propagation.
- Signaling NaNs.
- Subnormal operands.
- Overflow.
- Underflow.
- Signed zero.

### 3.5 FP32 Alignment and Normalization

The alignment and normalization stages require bit-level verification.

Particular attention must be given to:

- Exponent alignment.
- Shift-right-jam behavior.
- Guard, round, and sticky bits.
- Signed magnitude arithmetic.
- Cancellation.
- Normal and subnormal results.

## 4. N300 Arithmetic Requirements

N300 must establish formally defined arithmetic behavior for:

- INT16, INT8, INT4 and INT2.
- FP32.
- BF16.
- FP16.
- FP8 E4M3 and E5M2.
- FP6 and FP4, subject to format selection.
- Ternary arithmetic, subject to architectural validation.

Not every format is required to have a dedicated physical execution unit.

Instruction semantics must define the supported formats and conversion behavior.

## 5. Mandatory Validation

Every arithmetic implementation must pass:

1. Directed functional tests.
2. Boundary-value tests.
3. Randomized differential tests.
4. Overflow and underflow tests.
5. Special-value tests.
6. Bit-exact reference comparison.
7. Reset and valid-signal tests.
8. Synthesis and timing evaluation.

Floating-point operations must be compared against an independently specified reference model.

## 6. Transfer Policy

No N200 arithmetic module is automatically accepted into N300 RTL.

Transfer requires:

- Interface review.
- Width and signedness review.
- Numerical verification.
- Reset and latency review.
- Golden Emulator agreement.
- N300-specific regression tests.

## 7. Acceptance Status

Current status: INSPECTED, NOT CERTIFIED FOR N300.

The N300 arithmetic architecture must be independently specified before implementation freeze.

---

END OF DOCUMENT
