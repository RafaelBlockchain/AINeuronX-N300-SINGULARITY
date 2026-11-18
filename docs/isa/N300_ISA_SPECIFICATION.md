
# AINeuronX N300 — SINGULARITY
# N300 INSTRUCTION SET ARCHITECTURE (N300-ISA)

- Document ID: N300-ISA-001
- Version: 0.2
- Status: DRAFT
- Architecture: AI-Native / AI-Concurrent
- Base Instruction Width: 64 bits (provisional)
- Target Process: 16 nm (provisional)
- Parent Document: docs/architecture/N300_MASTER_ARCHITECTURE.md

---

# 1. PURPOSE AND ARCHITECTURAL PRINCIPLES

## 1.1 Purpose

This document defines the Instruction Set Architecture (ISA) of the AINeuronX N300 SINGULARITY processor.

The N300-ISA establishes the software-visible contract between:

- Hardware execution units.
- N300 Compiler.
- Golden Emulator.
- N300 Runtime.
- NeuronOS.
- AI workload execution environments.

The ISA defines instruction behavior, register semantics, numerical operations, memory access, synchronization, agent execution, and architectural exceptions.

The ISA is the authoritative specification for architectural behavior.

Hardware and software implementations must conform to this specification.

## 1.2 Architectural Identity

N300 is designed as an AI-Native and AI-Concurrent processor architecture.

Its fundamental architectural principle is:

**Concurrency must be a native property of the processor architecture.**

The ISA must support:

- Scalar computation.
- Vector computation.
- Tensor computation.
- Parallel execution.
- Independent AI agent contexts.
- Explicit synchronization.
- Efficient data movement.
- Controlled memory access.
- Multiple numerical representations.
- Extensible execution capabilities.

## 1.3 Design Principles

The N300-ISA follows these principles:

1. Deterministic architectural behavior.
2. Explicit numerical semantics.
3. Native tensor and vector operations.
4. Hardware-supported concurrent execution.
5. Agent-aware execution contexts.
6. Explicit memory ordering and synchronization.
7. Protected execution and resource ownership.
8. Efficient instruction decoding.
9. Compiler-friendly instruction semantics.
10. Extensible instruction encoding.

## 1.4 Instruction Families

The architecture defines seven primary instruction families:

| Family | Identifier | Responsibility |
|---|---|---|
| SCALAR | SCALAR | Scalar arithmetic and control |
| VECTOR | VECTOR | Vector operations |
| TENSOR | TENSOR | Matrix and tensor computation |
| MEMORY | MEMORY | Memory access and data movement |
| AGENT | AGENT | Agent context management |
| CONCURRENT | CONCURRENT | Parallel execution and synchronization |
| CONTROL | CONTROL | System control and execution flow |

Each family must have formally defined operations, operand types, encoding, execution semantics, and exception behavior.

## 1.5 Architectural Compatibility

The ISA must support future architectural extensions without unnecessarily breaking existing software.

New instructions must use explicitly allocated encoding space or formally defined extension mechanisms.

An implementation must identify the ISA version and supported extensions.

Unsupported instructions must produce a defined architectural exception.

## 1.6 Numerical Integrity

All arithmetic instructions must have explicitly defined:

- Operand formats.
- Result formats.
- Accumulator formats.
- Rounding modes.
- Overflow behavior.
- Underflow behavior.
- Exceptional values.
- Saturation behavior, where applicable.

No numerical operation may depend on undocumented implementation behavior.

## 1.7 Implementation Independence

The ISA defines observable behavior, not a mandatory physical microarchitecture.

Implementations may use different internal pipelines, execution units, scheduling strategies, and physical register organizations provided that architectural behavior remains compliant.

---

# 2. EXECUTION MODEL

## 2.1 General Model

N300 uses a heterogeneous execution model combining:

- Native instructions.
- Memory-resident work descriptors.
- Hardware-managed execution resources.
- Concurrent agent contexts.

The processor accepts work through architectural instruction execution and defined work-submission mechanisms.

The execution model must allow independent operations to progress concurrently when dependencies and hardware resources permit.

## 2.2 Execution Domains

The architecture defines five conceptual execution domains:

### A. Scalar Domain

Executes scalar arithmetic, address calculations, indexing, control operations, and supporting instructions.

### B. Vector Domain

Executes operations across multiple elements using vector registers.

### C. Tensor Domain

Executes matrix multiplication, tensor arithmetic, reductions, and specialized AI operations.

### D. Memory Domain

Manages architectural memory operations, DMA requests, data movement, and synchronization with execution units.

### E. Agent and Concurrent Domain

Manages independent execution contexts, work submission, synchronization, and resource coordination.

These domains are logical architectural responsibilities. Their physical implementation and degree of parallelism remain implementation-defined within the ISA contract.

## 2.3 Instruction Execution

Every instruction must follow a defined architectural process:

1. Instruction fetch or command retrieval.
2. Instruction decoding.
3. Operand validation.
4. Dependency evaluation.
5. Execution or work submission.
6. Result generation.
7. Architectural state update.
8. Completion or exception reporting.

Implementations may overlap or reorder internal execution stages where permitted by the defined memory model and synchronization rules.

## 2.4 Native Instruction Execution

Native instructions execute through the processor's instruction interface.

The ISA must define:

- Instruction encoding.
- Opcode interpretation.
- Operand fields.
- Register references.
- Immediate values.
- Execution semantics.
- Completion behavior.
- Exception conditions.

The initial base instruction width is 64 bits.

Variable-length or multiword extension mechanisms remain subject to formal encoding design.

## 2.5 Work Descriptor Execution

N300 supports a memory-resident work descriptor model.

A work descriptor represents an operation or group of operations submitted to hardware execution resources.

A descriptor may contain:

- Operation identifier.
- Execution domain.
- Source and destination references.
- Tensor or vector dimensions.
- Numerical format.
- Memory references.
- Dependency information.
- Agent ownership.
- Completion destination.
- Error reporting information.

The exact descriptor layout, alignment, validation rules, and submission instructions must be defined in subsequent ISA sections.

Descriptors must be validated before execution.

## 2.6 Concurrent Execution

N300 must support independent execution of multiple operations.

Concurrency may occur between:

- Scalar operations.
- Vector operations.
- Tensor operations.
- DMA transfers.
- Independent agents.
- Independent work descriptors.

The ISA must define the dependencies and synchronization mechanisms that determine when concurrent execution is architecturally valid.

Concurrency does not imply that every submitted operation executes simultaneously.

Actual parallelism depends on available hardware resources, resource allocation, and dependency constraints.

## 2.7 Agent Execution Context

An agent is an architectural execution entity associated with a protected execution context.

An agent context may contain:

- Agent identifier.
- Execution state.
- General-purpose registers.
- Vector register state.
- Predicate state.
- Memory permissions.
- Work queue ownership.
- Synchronization state.
- Exception state.

The ISA must define the operations that create, configure, activate, suspend, resume, and terminate agent contexts.

The maximum number of resident and simultaneously active agents is implementation-defined and must be discoverable through architectural capability mechanisms.

## 2.8 Execution Ordering

The architecture must define ordering guarantees for:

- Register dependencies.
- Memory operations.
- DMA transfers.
- Work descriptor submission.
- Completion notifications.
- Agent synchronization.
- Shared-memory visibility.

Independent operations may execute out of order when doing so does not violate architectural dependencies or memory-ordering requirements.

Explicit synchronization instructions must provide the required ordering guarantees.

## 2.9 Completion Model

Every asynchronous operation must have a defined completion mechanism.

Possible completion mechanisms include:

- Completion registers.
- Events.
- Queue notifications.
- Interrupts.
- Synchronization objects.

The exact mechanisms and their architectural semantics will be defined in subsequent sections.

An operation must not be considered complete merely because it has been submitted.

## 2.10 Execution Errors

The architecture must distinguish between:

- Invalid instruction.
- Invalid operand.
- Invalid descriptor.
- Memory access violation.
- Unsupported operation.
- Resource exhaustion.
- Execution timeout, where supported.
- Hardware-reported execution failure.

- 
# 3. INSTRUCTION ENCODING FORMAT

## 3.1 Encoding Objectives

The N300 instruction encoding system must provide:

- Efficient instruction decoding.
- Consistent instruction classification.
- Support for scalar, vector, and tensor operations.
- Explicit operand identification.
- Support for immediate values.
- Future architectural extensibility.
- Compatibility with compiler-generated instructions.
- Support for agent and concurrent execution operations.

The encoding system must balance decoding simplicity, instruction density, and architectural flexibility.

## 3.2 Base Instruction Width

The proposed base instruction width is 64 bits.

A base instruction is represented as one 64-bit architectural instruction word.

The 64-bit format is the initial encoding foundation, not a restriction on all future instructions.

Instructions requiring additional information may use formally defined extension words.

The exact extension mechanism remains OPEN until encoding analysis and decoder verification are completed.

## 3.3 Proposed Base Encoding Structure

The initial encoding model contains the following logical fields:

| Field | Purpose |
|---|---|
| Opcode | Primary operation classification |
| Subopcode | Operation identification |
| Destination | Destination register or resource |
| Source A | First source operand |
| Source B | Second source operand |
| Modifier | Operation modifiers |
| Immediate | Embedded constant or offset |
| Extension | Extension identification or reserved encoding space |

These fields represent logical encoding responsibilities.

Their final bit positions and widths have NOT been frozen.

The encoding must be designed to avoid unnecessary decoder complexity and preserve sufficient space for future instruction families.

## 3.4 Instruction Classification

Every instruction must be identifiable by its architectural family.

The proposed primary families are:

- SCALAR
- VECTOR
- TENSOR
- MEMORY
- AGENT
- CONCURRENT
- CONTROL

The decoder must determine the instruction family before applying family-specific operand interpretation.

Reserved encodings must never silently acquire a different meaning in an existing ISA version.

## 3.5 Operand Model

Instructions may reference:

- General-purpose registers.
- Vector registers.
- Predicate registers.
- Immediate values.
- Memory addresses.
- Work descriptors.
- Agent contexts.
- Architectural control registers.

Operand interpretation depends on the instruction family.

An instruction must define the number, type, width, and access permissions of all its operands.

## 3.6 Register Operand Encoding

Register references must identify the architectural register class and register index.

The encoding design must support the proposed vector register set:

V0 through V31.

The physical implementation of the register file is not prescribed by the encoding specification.

The number and encoding of general-purpose and predicate registers remain OPEN.

## 3.7 Immediate Values

Immediate operands may be used for:

- Constants.
- Memory offsets.
- Vector lengths.
- Tensor dimensions.
- Control modifiers.
- Branch displacements.
- Synchronization parameters.

Immediate width and signedness must be explicitly defined for each instruction format.

Larger constants and complex parameters may require extension words or memory-resident descriptors.

## 3.8 Instruction Formats

The ISA will use family-specific instruction formats.

The proposed logical formats are:

### A. Scalar Format

For scalar arithmetic, logical operations, comparisons, and address calculations.

### B. Vector Format

For vector arithmetic, comparisons, masking, and data transformations.

### C. Tensor Format

For matrix and tensor operations, including references to tensor dimensions and numerical formats.

### D. Memory Format

For loads, stores, prefetch, memory synchronization, and DMA-related operations.

### E. Agent Format

For agent context management and execution control.

### F. Concurrent Format

For asynchronous submission, dependencies, events, barriers, and completion operations.

### G. Control Format

For branches, system control, exceptions, and architectural state management.

These are architectural format categories. Their binary layouts remain OPEN.

## 3.9 Extended Instructions

The architecture may define extended instruction sequences.

An extended instruction may contain:

- A base instruction word.
- One or more extension words.
- Additional immediate data.
- Extended operation parameters.

The extension mechanism must define:

1. How the decoder recognizes an extended instruction.
2. How many extension words are consumed.
3. How instruction boundaries are determined.
4. How invalid or incomplete sequences are handled.
5. How extensions interact with instruction fetching and control flow.

No extension encoding is considered final in this version.

## 3.10 Descriptor-Based Operations

Complex operations should not require every parameter to be encoded directly in an instruction word.

Tensor operations, DMA transfers, and multi-agent workloads may reference validated memory-resident descriptors.

The base instruction identifies the operation and the descriptor or submission resource.

Descriptor formats must be specified separately and must include validation, ownership, and error-reporting semantics.

## 3.11 Reserved Encodings

Reserved encoding values must be handled deterministically.

Unless an extension explicitly defines otherwise:

- Unsupported encodings must produce a defined illegal-instruction exception.
- Reserved fields must have defined required values.
- Implementations must not reinterpret reserved encodings as unrelated operations.
- Future extensions must preserve existing instruction meanings.

## 3.12 Decoder Requirements

A conforming decoder must:

- Identify instruction boundaries.
- Classify instruction families.
- Decode valid operands.
- Validate required fields.
- Detect unsupported instructions.
- Identify extension sequences.
- Report invalid encodings.
- Preserve architectural execution semantics.

Decoder implementations may differ internally.

Their externally observable behavior must remain compliant.

## 3.13 Encoding Compatibility

Every published ISA version must identify:

- Base encoding version.
- Supported instruction families.
- Supported extensions.
- Required architectural features.
- Optional architectural features.
- Reserved encoding ranges.

Future extensions must not break the interpretation of valid instructions in previously published versions.

## 3.14 Encoding Validation

Before encoding freeze, the N300 project must demonstrate:

1. A complete encoding map.
2. No unintended opcode collisions.
3. Unambiguous instruction boundaries.
4. Successful decoder implementation.
5. Golden Emulator compatibility.
6. Positive and negative decoding tests.
7. Extension compatibility tests.
8. Compiler integration tests.

## 3.15 Open Encoding Decisions

The following decisions remain OPEN:

- Exact opcode width.
- Exact subopcode width.
- Register field widths.
- Immediate field widths.
- Instruction extension mechanism.
- Variable-length versus fixed-length extended sequences.
- Branch encoding.
- Predicate encoding.
- Tensor descriptor references.
- Agent identifier representation.
- Reserved encoding allocation.
- Decoder complexity and implementation cost.

No binary encoding is frozen by this document.

---

END OF SECTION 3


# 4. ARCHITECTURAL STATE AND REGISTER MODEL

## 4.1 Architectural State

The N300 architectural state defines the processor-visible information required to execute instructions and maintain execution contexts.

The architectural state includes:

- Program Counter.
- General-Purpose Registers.
- Vector Registers.
- Predicate Registers.
- Architectural Status Registers.
- Control and Configuration Registers.
- Agent Context State.
- Exception State.

The architectural state must be independently maintained wherever execution isolation requires it.

## 4.2 Program Counter (PC)

The Program Counter identifies the architectural instruction address associated with an execution context.

The PC must support:

- Sequential instruction execution.
- Conditional control flow.
- Unconditional branches.
- Function and procedure calls, where supported.
- Exception entry and return.
- Defined instruction-extension boundaries.

The PC address width, alignment requirements, privilege behavior, and address translation rules remain OPEN.

## 4.3 General-Purpose Registers (GPR)

N300 defines a General-Purpose Register class for scalar computation and architectural control operations.

GPRs are intended to support:

- Integer arithmetic.
- Logical operations.
- Address generation.
- Loop control.
- Index calculations.
- Descriptor references.
- Agent and runtime parameters.

The following details remain OPEN:

- Number of GPRs.
- Register width.
- Register encoding.
- Reserved register conventions.
- Zero-register behavior.
- Calling convention.
- Context-switch behavior.

The final GPR organization must be evaluated against compiler requirements and instruction encoding efficiency.

## 4.4 Vector Register File (VRF)

The proposed N300 vector register architecture contains:

- 32 architectural vector registers.
- Register identifiers V0 through V31.
- 512 bits per architectural vector register.
- Independent logical register state per execution context.

The proposed logical capacity is:

32 × 512 bits = 16,384 bits.

This corresponds to 2,048 bytes (2 KiB) of vector register state per context.

This is an architectural capacity proposal, not a commitment to a specific physical register-file implementation.

## 4.5 Vector Register Semantics

Vector registers support operations involving multiple data elements.

The interpretation of a vector register depends on the active instruction and its element format.

Supported candidate formats include:

- FP32.
- BF16.
- FP16.
- FP8 E4M3.
- FP8 E5M2.
- FP6.
- FP4.
- INT8.
- INT4.
- INT2.

Ternary representations are under evaluation as a specialized extension.

The number of logical elements available in a 512-bit register depends on the selected element width.

Instruction-specific rules must define:

- Element interpretation.
- Active lanes.
- Masking behavior.
- Lane ordering.
- Result placement.
- Inactive-lane behavior.

No universal lane interpretation is assumed for all instructions.

## 4.6 Vector Register Access

The initial VRF implementation target proposes:

- Two logical read ports.
- One logical write port.

This is a preliminary microarchitectural target.

It does not define a mandatory physical implementation.

Banking, replication, bypass networks, multi-cycle access, and arbitration may be used if architectural behavior remains compliant.

The design must evaluate register-file area, timing, power, and execution-unit demand.

## 4.7 Predicate Registers

Predicate state supports conditional execution and vector lane selection.

Predicate registers may be used for:

- Conditional scalar operations.
- Vector masking.
- Select operations.
- Conditional updates.
- Control-flow decisions.

The following remain OPEN:

- Number of predicate registers.
- Predicate width.
- Predicate encoding.
- Mask granularity.
- Inactive-lane semantics.
- Predicate update rules.

Every instruction using predicate state must define its exact behavior.

## 4.8 Architectural Status Registers

N300 may define status registers for architectural execution conditions.

Candidate status information includes:

- Arithmetic condition state.
- Comparison results.
- Execution mode.
- Exception state.
- Instruction completion state.
- Synchronization status.

The final status-register organization remains OPEN.

Status updates must be explicitly specified for every instruction that modifies architectural status.

## 4.9 Control and Configuration Registers

Control and configuration registers provide access to architectural execution settings.

Candidate categories include:

- ISA capability information.
- Enabled architectural extensions.
- Execution configuration.
- Memory configuration.
- Agent configuration.
- Performance monitoring controls.
- Exception configuration.
- Privilege and protection controls.

The exact register map, access permissions, reset values, and read/write behavior must be formally specified before implementation freeze.

## 4.10 Agent Context State

Each independently protected agent context must maintain the architectural state required for its execution.

The proposed context state includes:

- Agent identifier.
- Program Counter.
- General-Purpose Registers.
- Vector Registers.
- Predicate Registers.
- Architectural Status.
- Control State.
- Memory Permissions.
- Execution State.
- Exception State.
- Synchronization State.
- Work Ownership Information.

Context switching must preserve all architecturally required state.

An implementation may use physical registers, register renaming, memory-backed context storage, or other mechanisms.

The physical implementation must preserve architectural isolation and correctness.

## 4.11 Context Isolation

Architectural state belonging to one protected agent must not become directly accessible to another agent without explicit authorization.

Isolation requirements apply to:

- Register state.
- Memory permissions.
- Work descriptors.
- DMA operations.
- Synchronization resources.
- Exception information.

Context transitions must prevent unauthorized state exposure.

## 4.12 Register Reset and Initialization

The architecture must define reset and initialization behavior for all architectural state.

The following must be specified:

- Initial Program Counter.
- Initial register state.
- Predicate initialization.
- Status initialization.
- Agent context initialization.
- Exception initialization.
- Privileged configuration initialization.

No software-visible register value may be assumed to have a particular reset value unless explicitly defined by the ISA or platform specification.

## 4.13 Register State and Exceptions

Exceptions must preserve sufficient architectural information to support diagnosis and recovery.

The architecture must define:

- Faulting instruction address.
- Exception cause.
- Relevant operand or memory information.
- Context identity.
- Restartability.
- State preservation.
- Exception return behavior.

The exact exception register layout remains OPEN.

## 4.14 Register Model Validation

Before architectural freeze, the project must demonstrate:

1. Complete architectural register definitions.
2. Unambiguous register access semantics.
3. Correct context isolation.
4. Correct context save and restore.
5. Defined reset behavior.
6. Defined exception-state preservation.
7. Compiler register-allocation compatibility.
8. Golden Emulator register-state agreement.

## 4.15 Open Register Decisions

The following decisions remain OPEN:

- GPR count and width.
- Predicate register count and width.
- Status register definitions.
- Control register map.
- PC width and alignment.
- Vector lane ordering.
- Vector masking semantics.
- VRF physical organization.
- VRF banking and access scheduling.
- Context storage implementation.
- Maximum resident contexts.
- Reset values.
- Exception register organization.

The proposed 32 × 512-bit vector register architecture remains subject to implementation and verification.

---

END OF SECTION 4

Section 5 — SCALAR Instructions

Document: N300 ISA Specification
Section: 5
Version: 0.2
Status: DRAFT / PROPOSED — NOT FROZEN
Architecture: N300 SINGULARITY

---

5.1 Purpose

The SCALAR instruction family provides general-purpose integer computation and control-value preparation.

Its responsibilities include:

- Integer arithmetic.
- Bitwise logical operations.
- Bit shifting and bit manipulation.
- Signed and unsigned comparisons.
- Register-to-register data movement.
- Immediate-value operations.
- Scalar address and index preparation for other execution domains.

The SCALAR execution domain is designed to coordinate with VECTOR, TENSOR, MEMORY, AGENT and CONCURRENT execution domains.

Scalar instructions must remain useful for traditional software workloads while supporting AI-native execution and autonomous scheduling.

5.2 Architectural Register Interface

Scalar instructions operate on the General-Purpose Register File (GPR).

The following notation is used:

Symbol| Meaning
"GPR[rs1]"| First source register
"GPR[rs2]"| Second source register
"GPR[rd]"| Destination register
"IMM"| Immediate value encoded in the instruction
"XLEN"| Architectural scalar register width

The following parameters remain open:

- Total number of GPR registers.
- Architectural scalar width (XLEN).
- Physical register implementation.
- Register renaming strategy.
- Number of scalar execution pipelines.

No physical register count or implementation requirement is frozen by this section.

5.3 Arithmetic Instructions

The arithmetic instruction family performs integer calculations.

Mnemonic| Operation| Description
"ADD"| "rd = rs1 + rs2"| Integer addition
"ADDI"| "rd = rs1 + IMM"| Addition with immediate
"SUB"| "rd = rs1 - rs2"| Integer subtraction
"MUL"| "rd = rs1 × rs2"| Low XLEN bits of multiplication
"MULH"| High half of signed multiplication| Signed high-product extraction
"MULHU"| High half of unsigned multiplication| Unsigned high-product extraction
"MULHSU"| High half of signed × unsigned multiplication| Mixed-sign high-product extraction
"NEG"| "rd = 0 - rs1"| Two's-complement negation

5.3.1 Arithmetic Semantics

Integer arithmetic uses two's-complement representation for signed interpretation.

Unless an instruction explicitly specifies otherwise:

- Arithmetic results are XLEN bits wide.
- Addition and subtraction retain the low XLEN bits.
- Integer overflow wraps modulo (2^{XLEN}).
- Signedness affects interpretation and comparison, not the underlying register bit pattern.
- Arithmetic overflow does not automatically generate an exception.

The "MUL" instruction returns the low XLEN bits of the mathematical product.

The high-product instructions return the upper XLEN bits of the corresponding 2×XLEN-bit product.

5.4 Logical Instructions

Logical operations work independently on each bit position.

Mnemonic| Operation| Description
"AND"| "rd = rs1 AND rs2"| Bitwise AND
"ANDI"| "rd = rs1 AND IMM"| AND with immediate
"OR"| "rd = rs1 OR rs2"| Bitwise OR
"ORI"| "rd = rs1 OR IMM"| OR with immediate
"XOR"| "rd = rs1 XOR rs2"| Bitwise XOR
"XORI"| "rd = rs1 XOR IMM"| XOR with immediate
"NOT"| "rd = NOT rs1"| Bitwise inversion

Logical operations do not modify architectural arithmetic flags.

5.5 Shift Instructions

The SCALAR domain supports logical and arithmetic shifts.

Mnemonic| Operation| Description
"SLL"| "rd = rs1 << shamt"| Logical left shift
"SRL"| "rd = rs1 >> shamt"| Logical right shift
"SRA"| Arithmetic right shift| Preserves the sign bit
"SLLI"| Left shift by immediate| Immediate shift amount
"SRLI"| Logical right shift by immediate| Immediate shift amount
"SRAI"| Arithmetic right shift by immediate| Immediate shift amount

5.5.1 Shift Semantics

- Logical left shifts introduce zero bits from the right.
- Logical right shifts introduce zero bits from the left.
- Arithmetic right shifts replicate the original sign bit.
- Shift operations produce XLEN-bit results.
- The effective shift amount must be interpreted consistently across register and immediate forms.

Proposed rule: the effective shift amount is reduced modulo XLEN.

This rule remains subject to verification against the final instruction encoding and decoder design.

5.6 Comparison Instructions

Comparison operations return a scalar Boolean result.

The proposed representation is:

- "0" = false.
- "1" = true.
- All other result bits are zero.

Mnemonic| Operation| Description
"SLT"| "rd = signed(rs1) < signed(rs2)"| Signed less-than
"SLTU"| "rd = unsigned(rs1) < unsigned(rs2)"| Unsigned less-than
"SLTI"| "rd = signed(rs1) < signed(IMM)"| Signed immediate comparison
"SLTIU"| "rd = unsigned(rs1) < unsigned(IMM)"| Unsigned immediate comparison
"SEQ"| "rd = (rs1 == rs2)"| Equality
"SNE"| "rd = (rs1 != rs2)"| Inequality
"SGT"| "rd = signed(rs1) > signed(rs2)"| Signed greater-than
"SGTU"| "rd = unsigned(rs1) > unsigned(rs2)"| Unsigned greater-than

Comparison instructions do not require a global condition-code register.

Their Boolean results can be consumed by subsequent scalar instructions or used to prepare decisions for the CONTROL and AGENT domains.

5.7 Data Movement Instructions

The scalar register interface provides explicit data movement operations.

Mnemonic| Operation| Description
"MOV"| "rd = rs1"| Register copy
"MOVI"| "rd = IMM"| Immediate-value load
"SEXT"| Sign-extend source| Signed extension
"ZEXT"| Zero-extend source| Unsigned extension

The exact immediate widths and extension source widths depend on the final instruction formats.

"SEXT" and "ZEXT" must explicitly identify the source width in their final encoding or instruction semantics.

No assumption is made here about a permanently reserved zero register.

5.8 Immediate Encoding and Extension

Immediate values allow scalar instructions to operate without requiring a second source register.

The ISA proposes support for:

- Signed immediates.
- Unsigned immediates.
- Shift immediates.
- Constant-generation immediates.
- Extended immediate formats where required.

The instruction definition must specify whether each immediate is sign-extended or zero-extended.

Immediate width, bit placement and extension format remain pending finalization of Section 3.

5.9 Scalar Execution Semantics

Scalar instructions follow these general rules:

1. Source operands are read from the architectural scalar register state.
2. The operation is performed by the scalar execution domain.
3. The result is written to the destination register when execution completes.
4. Instructions must preserve architectural state according to the defined exception and completion rules.
5. Operations with invalid encodings must not execute as valid instructions.
6. Scalar instructions must not silently modify unrelated architectural registers.

The implementation may use pipelining, forwarding, out-of-order execution or register renaming, provided that architectural behavior remains correct.

5.10 Interaction with Other Execution Domains

The SCALAR domain is not intended to operate in isolation.

It provides support to other N300 execution domains:

Domain| Scalar contribution
VECTOR| Loop control, indices and vector-length preparation
TENSOR| Dimensions, offsets and operation parameters
MEMORY| Address calculations and memory-operation parameters
AGENT| Agent identifiers, state values and decision parameters
CONCURRENT| Task identifiers, dependency values and synchronization parameters
CONTROL| Conditional decisions and control-flow preparation

Scalar instructions must not replace specialized VECTOR or TENSOR execution when those domains offer a more efficient implementation.

5.11 Exceptions and Reserved Behavior

The following cases require explicit handling in the final architecture:

- Invalid instruction encoding.
- Unsupported instruction modifiers.
- Illegal register references.
- Invalid immediate formats.
- Unsupported execution modes.

Integer overflow follows the modular arithmetic behavior defined in Section 5.3 unless a future instruction explicitly defines a different behavior.

Division and remainder instructions are intentionally deferred. Their latency, division-by-zero behavior, signed overflow behavior and implementation cost must be evaluated before inclusion in the mandatory scalar instruction set.

5.12 Performance and Implementation Objectives

The SCALAR execution domain should prioritize:

- Low-latency integer arithmetic.
- Efficient address generation.
- High-throughput logical operations.
- Fast branch-decision preparation.
- Efficient interaction with vector and tensor engines.
- Minimal interference with specialized AI compute pipelines.

The ISA does not mandate a specific number of scalar ALUs or pipeline stages.

Those decisions belong to the microarchitecture and physical implementation specifications.

5.13 Open Architectural Decisions

The following items remain open and must be resolved before freezing this section:

1. Final XLEN: 32, 64 or another architectural width.
2. Number of architectural GPR registers.
3. Immediate widths and encoding formats.
4. Whether division and remainder are mandatory or optional.
5. Whether additional bit-manipulation instructions are required.
6. Whether population count and leading/trailing-zero operations belong in the base ISA.
7. Whether scalar predicate generation needs dedicated instructions.
8. Final instruction latency and throughput targets.

5.14 Section 5 Acceptance Criteria

Section 5 can only be frozen after:

- GPR count and XLEN are defined.
- Immediate formats are aligned with Section 3.
- All instruction semantics are unambiguous.
- Decoder behavior is specified.
- A scalar golden emulator exists.
- Directed and randomized instruction tests pass.
- RTL implementation matches the architectural reference model.
- Compiler and assembler mappings are defined.

Current status: DRAFT / PROPOSED — NOT FROZEN.

No opcode assignments are authorized by this section.

---

End of Section 5 — SCALAR Instructions



Error reporting must provide sufficient information for software recovery and debugging.

## 2.11 Architectural Compliance

An implementation conforms to the execution model only if it demonstrates:

1. Correct instruction interpretation.
2. Defined execution semantics.
3. Correct architectural state transitions.
4. Correct dependency handling.
5. Defined asynchronous completion.
6. Correct synchronization behavior.
7. Correct exception reporting.
8. Reproducible conformance tests.

The N300 Golden Emulator will serve as the executable architectural reference.

---

END OF SECTIONS 1 AND 2




