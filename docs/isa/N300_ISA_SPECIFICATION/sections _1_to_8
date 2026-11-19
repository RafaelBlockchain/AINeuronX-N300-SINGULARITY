
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

Section 6 — VECTOR Instructions

Document: N300 ISA Specification
Section: 6
Version: 0.2
Status: DRAFT / PROPOSED — NOT FROZEN
Architecture: N300 SINGULARITY

---

6.1 Purpose

The VECTOR instruction family provides data-parallel computation across multiple elements using a single architectural instruction.

Its primary objectives are:

- High-throughput parallel data processing.
- AI tensor preprocessing and postprocessing.
- Element-wise arithmetic.
- Vectorized memory operations.
- Mixed-precision computation.
- Masked execution.
- Reduction operations.
- Efficient interaction with TENSOR and MEMORY execution domains.

The VECTOR domain is designed to complement specialized matrix and tensor engines rather than replace them.

6.2 Vector Register Model

The preliminary architectural model proposes:

- 32 vector registers.
- Register identifiers V0–V31.
- 512 bits per vector register.
- Independent vector state per execution context.

These parameters are preliminary and remain subject to architectural and physical validation.

A vector register is logically composed of multiple elements.

The number of elements depends on the selected element width.

Element width| Elements per 512-bit register
8 bits| 64
16 bits| 32
32 bits| 16
64 bits| 8

The architecture must support multiple element widths without requiring a separate register file for every precision.

6.3 Vector Length and Execution Configuration

Vector execution uses an architectural vector configuration.

The proposed configuration contains:

- "VL": active vector length.
- "SEW": selected standard element width.
- "LMUL": logical vector grouping multiplier.
- "MASK": optional element execution mask.

The exact encoding and register-grouping rules remain open.

The active vector length must never exceed the implementation-supported capacity of the selected configuration.

The architecture may support shorter vector lengths to enable scalable execution across different N300 implementations.

6.4 Vector Configuration Instructions

Mnemonic| Description
"VSETVL"| Configure active vector length
"VSETSEW"| Configure standard element width
"VSETLMUL"| Configure logical vector grouping
"VGETVL"| Read active vector length
"VGETSEW"| Read active element width

The final ISA may consolidate some configuration operations into a single instruction.

The architectural behavior must remain deterministic.

6.5 Vector Arithmetic Instructions

The following instructions define the proposed base arithmetic operations.

Mnemonic| Operation| Description
"VADD"| "vd[i] = vs1[i] + vs2[i]"| Element-wise addition
"VSUB"| "vd[i] = vs1[i] - vs2[i]"| Element-wise subtraction
"VMUL"| "vd[i] = vs1[i] × vs2[i]"| Element-wise multiplication
"VDIV"| "vd[i] = vs1[i] / vs2[i]"| Element-wise division
"VMIN"| Minimum of two elements| Element-wise minimum
"VMAX"| Maximum of two elements| Element-wise maximum
"VABS"| Absolute value| Element-wise absolute value
"VNEG"| Negation| Element-wise negation

The selected element type determines the arithmetic interpretation.

Integer operations use the specified signed or unsigned interpretation.

Floating-point operations follow the selected floating-point format and rounding mode.

Division is an optional capability until its implementation cost and exact exceptional behavior are defined.

6.6 Vector Logical Instructions

Mnemonic| Description
"VAND"| Element-wise bitwise AND
"VOR"| Element-wise bitwise OR
"VXOR"| Element-wise bitwise XOR
"VNOT"| Element-wise bitwise inversion
"VSLL"| Element-wise logical left shift
"VSRL"| Element-wise logical right shift
"VSRA"| Element-wise arithmetic right shift

Logical operations operate on the bit representation of each element.

Shift semantics must be defined according to the element width.

6.7 Vector Floating-Point Instructions

The N300 VECTOR domain proposes support for:

- FP32
- BF16
- FP16
- FP8
- FP6
- FP4

These formats are architectural targets, not proof that every format has already been implemented in RTL.

Proposed instructions:

Mnemonic| Description
"VFADD"| Floating-point vector addition
"VFSUB"| Floating-point vector subtraction
"VFMUL"| Floating-point vector multiplication
"VFDIV"| Floating-point vector division
"VFSQRT"| Floating-point square root
"VFMIN"| Floating-point minimum
"VFMAX"| Floating-point maximum
"VFABS"| Floating-point absolute value
"VFNEG"| Floating-point negation

The selected format must be explicit in the instruction or execution configuration.

The ISA must not silently reinterpret one floating-point format as another.

6.8 Fused Multiply-Add

The VECTOR domain proposes fused multiply-add support.

Mnemonic| Operation
"VFMA"| "vd[i] = vs1[i] × vs2[i] + vs3[i]"
"VFMS"| "vd[i] = vs1[i] × vs2[i] - vs3[i]"

Fused operations must perform multiplication and addition with a single final rounding operation where the selected numerical format defines IEEE-style fused semantics.

The exact support matrix for each floating-point format remains open.

6.9 Vector Comparison Instructions

Mnemonic| Description
"VCEQ"| Element-wise equality
"VCNE"| Element-wise inequality
"VCLT"| Element-wise less-than
"VCLE"| Element-wise less-than or equal
"VCGT"| Element-wise greater-than
"VCGE"| Element-wise greater-than or equal

Comparison results produce vector predicates.

The predicate representation and storage layout must be specified in the architectural predicate model.

Floating-point comparisons must define behavior for NaNs, signed zeros and unordered comparisons.

6.10 Masked Vector Execution

Masked execution allows individual vector elements to be enabled or disabled.

The proposed instruction model supports:

- Execution with all active elements.
- Execution using an explicit predicate mask.
- Masked loads and stores.
- Masked arithmetic.
- Masked comparisons.

For a masked operation:

- Enabled elements execute normally.
- Disabled elements follow the instruction's defined inactive-element policy.
- Inactive elements must not cause unintended memory accesses.
- Mask behavior must remain deterministic.

The final ISA must explicitly define whether inactive destination elements are preserved, cleared or assigned another specified value.

6.11 Vector Reduction Instructions

Reduction operations combine multiple vector elements into a scalar or vector result.

Mnemonic| Description
"VREDUCE_ADD"| Sum of active elements
"VREDUCE_MUL"| Product of active elements
"VREDUCE_MIN"| Minimum active element
"VREDUCE_MAX"| Maximum active element
"VREDUCE_AND"| Bitwise AND reduction
"VREDUCE_OR"| Bitwise OR reduction
"VREDUCE_XOR"| Bitwise XOR reduction

Floating-point reductions require an explicit reproducibility policy.

The architecture must distinguish:

- Deterministic reduction order.
- Implementation-defined parallel reduction order.
- Numerically reproducible reduction modes, where supported.

The selected policy affects numerical reproducibility and performance.

6.12 Vector Memory Instructions

The VECTOR domain works with the MEMORY domain to support data movement.

Proposed operations:

Mnemonic| Description
"VLOAD"| Load vector elements from memory
"VSTORE"| Store vector elements to memory
"VGATHER"| Load elements using vector indices
"VSCATTER"| Store elements using vector indices
"VLOAD_STRIDED"| Load elements using a stride
"VSTORE_STRIDED"| Store elements using a stride

Memory instructions must define:

- Element size.
- Alignment requirements.
- Address generation.
- Mask behavior.
- Fault handling.
- Memory ordering.
- Interaction with DMA.

Large tensor transfers should use specialized MEMORY and DMA mechanisms whenever they offer better throughput.

6.13 Vector Conversion Instructions

Mixed-precision workloads require explicit conversion operations.

Proposed conversion instructions:

Mnemonic| Description
"VFCVT"| Floating-point format conversion
"VICVT"| Integer conversion
"VF2I"| Floating-point to integer
"VI2F"| Integer to floating-point
"VSEXT"| Vector sign extension
"VZEXT"| Vector zero extension
"VNARROW"| Narrowing conversion
"VWIDEN"| Widening conversion

Conversion instructions must define:

- Source format.
- Destination format.
- Rounding mode.
- Saturation behavior, if applicable.
- NaN and infinity handling.
- Overflow and underflow behavior.

Conversions must not silently discard precision without an explicit architectural rule.

6.14 Vector Permutation and Data Rearrangement

AI workloads frequently require rearranging data before matrix and tensor operations.

Proposed instructions:

Mnemonic| Description
"VSHUFFLE"| Rearrange vector elements
"VSLIDEUP"| Shift elements toward higher indices
"VSLIDEDOWN"| Shift elements toward lower indices
"VREVERSE"| Reverse element order
"VZIP"| Interleave two vectors
"VUNZIP"| Separate interleaved vectors
"VCOMPRESS"| Compact selected elements
"VEXPAND"| Expand compacted elements using a mask

The architecture may implement some permutation operations through specialized hardware rather than dedicated execution pipelines.

6.15 Vector Context and Isolation

Each execution context must maintain an independent architectural vector state.

The implementation must protect:

- Vector registers.
- Vector configuration.
- Predicate state.
- Pending vector operations.
- Vector memory-operation metadata.

Context switching must not expose another agent's vector state.

The exact save/restore strategy is a microarchitectural decision.

6.16 Interaction with TENSOR and MATRIX Engines

The VECTOR domain provides complementary processing capabilities.

Typical workloads include:

- Activation functions.
- Normalization.
- Element-wise transformations.
- Attention preprocessing and postprocessing.
- Quantization and dequantization.
- Sparse metadata processing.
- Tensor layout transformations.
- Small reductions.
- Data preparation for matrix engines.

Large matrix multiplication and high-density tensor operations should be routed to specialized TENSOR or MATRIX engines where appropriate.

The compiler and runtime should select the execution domain based on operation characteristics, available resources and performance estimates.

6.17 Performance Objectives

The VECTOR domain should target:

- High elements-per-cycle throughput.
- Efficient mixed-precision execution.
- Low-overhead vector configuration.
- Masked execution without unnecessary work.
- Efficient load/store integration.
- High bandwidth between vector and tensor engines.
- Reduced data movement.
- Efficient pipeline utilization.

No fixed throughput or clock target is frozen in this section.

Performance must be measured through architectural simulation, RTL verification and physical implementation.

6.18 Open Architectural Decisions

The following decisions remain open:

1. Final vector register width.
2. Final vector register count.
3. Whether 512-bit registers remain the baseline.
4. Final SEW and LMUL definitions.
5. Predicate register count and encoding.
6. Supported rounding modes.
7. Exact FP6 and FP4 formats.
8. Saturation and exception semantics.
9. Deterministic floating-point reduction requirements.
10. Vector memory fault and ordering model.
11. Exact instruction encoding and opcode allocation.
12. Hardware division and square-root implementation strategy.

6.19 Section 6 Acceptance Criteria

Section 6 may only be frozen after:

- Vector register architecture is defined.
- Vector configuration semantics are unambiguous.
- Element widths and numerical formats are specified.
- Masking and predicate behavior are defined.
- Floating-point semantics are documented.
- Memory interactions are specified.
- A vector golden emulator exists.
- Directed and randomized tests pass.
- RTL matches the architectural reference model.
- Compiler and runtime mappings are validated.
- Performance is measured against representative AI workloads.

Current status: DRAFT / PROPOSED — NOT FROZEN.

No opcode assignments are authorized by this section.

---

End of Section 6 — VECTOR Instructions

Section 7 — TENSOR Instructions

Document: N300 ISA Specification
Section: 7
Version: 0.2
Status: DRAFT / PROPOSED — NOT FROZEN
Architecture: N300 SINGULARITY

---

7.1 Purpose

The TENSOR instruction family defines the architectural interface for high-throughput tensor and matrix computation.

Its primary objectives are:

- High-performance matrix multiplication.
- Multiply-accumulate operations.
- Mixed-precision AI computation.
- Dense and sparse tensor processing.
- Transformer acceleration.
- Attention computation.
- Mixture-of-Experts (MoE) workloads.
- Quantization-aware computation.
- Efficient interaction with VECTOR, MEMORY and CONCURRENT execution domains.

The TENSOR domain is the primary architectural interface for specialized AI compute engines.

7.2 Tensor Execution Model

Tensor instructions operate on multidimensional data structures.

The architectural model supports:

- One-dimensional vectors.
- Two-dimensional matrices.
- Multidimensional tensors.
- Block-based matrix operations.
- Tiled tensor operations.
- Sparse tensor representations.

Tensor operations may execute through specialized Matrix Engines, Sparse Engines, Attention Engines or other dedicated execution resources.

The ISA defines architectural behavior, not the physical implementation of each engine.

7.3 Tensor Data Types and Precision

The N300 architecture proposes support for the following numerical formats:

Format| Proposed role
FP32| High-precision computation
BF16| Training and mixed-precision AI
FP16| General AI computation
FP8| High-throughput AI inference and training
FP6| Aggressive bandwidth and compute optimization
FP4| Low-bit inference
INT8| Quantized inference
INT4| High-density quantized inference
INT2| Extreme quantization
Ternary| Experimental low-bit computation

Support for each format must be evaluated independently.

The ISA must explicitly define:

- Input format.
- Accumulator format.
- Output format.
- Rounding behavior.
- Saturation behavior.
- Overflow handling.
- Exceptional-value behavior, where applicable.

Ternary computation remains an experimental capability until its encoding, arithmetic semantics and implementation advantages are demonstrated.

7.4 Matrix Multiply Instructions

The base tensor instruction family includes matrix multiplication.

Mnemonic| Description
"TMATMUL"| General matrix multiplication
"TMATMUL_ACC"| Matrix multiplication with accumulator update
"TMATMUL_BIAS"| Matrix multiplication with bias
"TMATMUL_RELU"| Matrix multiplication with ReLU fusion
"TMATMUL_GELU"| Matrix multiplication with GELU fusion

The mathematical operation is based on:

[
C_{M \times N} =
A_{M \times K}
\times
B_{K \times N}
]

The architecture must support tiled execution to avoid requiring complete matrices to reside in local registers.

Fusion operations must preserve the numerical behavior specified by their architectural definitions.

The availability of fused activations may be implemented through specialized hardware or compiler/runtime transformations.

7.5 Matrix Multiply-Accumulate

The architecture proposes a dedicated matrix multiply-accumulate operation.

Mnemonic| Description
"TMMA"| Matrix multiply-accumulate

The conceptual operation is:

[
D = A \times B + C
]

The accumulator format may be wider than the input format.

Proposed accumulation targets include:

- FP32 accumulation.
- FP16 accumulation where explicitly supported.
- BF16 input with FP32 accumulation.
- FP8 input with FP16 or FP32 accumulation.
- INT8 input with wider integer accumulation.
- INT4 and INT2 input with wider integer accumulation.

The exact supported combinations must be defined in the numerical-format capability matrix.

The ISA must distinguish fused arithmetic from separate multiplication and addition where rounding behavior differs.

7.6 Tensor Tiling Instructions

Large matrix operations require efficient tiling.

Proposed operations:

Mnemonic| Description
"TILE_LOAD"| Load a tensor tile
"TILE_STORE"| Store a tensor tile
"TILE_MATMUL"| Execute matrix multiplication on tiles
"TILE_ACCUM"| Accumulate partial tile results
"TILE_CONFIG"| Configure tile dimensions and layout
"TILE_SYNC"| Synchronize tile execution

Tile dimensions, memory layout and execution parameters must be explicitly validated.

The hardware may support multiple tile sizes.

The final architecture must not assume that one tile size is optimal for every model or precision.

Automatic tile selection belongs to the compiler/runtime and must use actual hardware capabilities.

7.7 Accumulator Architecture

The TENSOR domain requires dedicated accumulator resources.

The architectural model must support:

- Partial matrix products.
- Accumulation across multiple tiles.
- Wider accumulation than input precision.
- Defined accumulator initialization.
- Defined accumulator update semantics.
- Defined completion and visibility rules.

Accumulator capacity and physical register organization remain open.

The implementation must prevent unintended loss of precision during partial accumulation.

7.8 Sparse Tensor Instructions

Sparse computation is essential for efficient execution of models with structured or unstructured sparsity.

Proposed instructions:

Mnemonic| Description
"TSPARSE_MATMUL"| Sparse matrix multiplication
"TSPARSE_ACCUM"| Sparse accumulation
"TSPARSE_LOAD"| Load sparse data and metadata
"TSPARSE_DECODE"| Decode sparse representation
"TSPARSE_COMPRESS"| Compress sparse values
"TSPARSE_EXPAND"| Expand sparse representation

The architecture should evaluate support for:

- Structured sparsity.
- Block sparsity.
- Unstructured sparsity.
- Compressed sparse representations.
- Dynamic sparsity.

Sparse execution must account for metadata overhead and irregular memory access.

A sparse operation must not be assumed to be faster than dense execution without measured evidence.

7.9 Mixture-of-Experts Instructions

N300 proposes specialized support for Mixture-of-Experts workloads.

The architecture must efficiently support:

- Expert selection.
- Token routing.
- Expert dispatch.
- Expert-specific matrix operations.
- Token aggregation.
- Load balancing.
- Expert execution synchronization.

Proposed instructions:

Mnemonic| Description
"TMOE_ROUTE"| Route tokens to experts
"TMOE_DISPATCH"| Dispatch token blocks
"TMOE_EXPERT_MATMUL"| Execute expert matrix operations
"TMOE_AGGREGATE"| Aggregate expert outputs
"TMOE_SYNC"| Synchronize expert execution

The routing algorithm must be defined independently from the instruction encoding.

The ISA should support flexible routing policies without hardcoding a specific model architecture.

7.10 Attention Instructions

The TENSOR domain proposes dedicated attention acceleration.

Supported architectural targets include:

- Multi-Head Attention (MHA).
- Grouped-Query Attention (GQA).
- Multi-Query Attention (MQA).
- Multi-head Latent Attention (MLA).

Proposed instructions:

Mnemonic| Description
"TATTN_QK"| Compute query-key products
"TATTN_SCORE"| Generate attention scores
"TATTN_SOFTMAX"| Perform attention softmax
"TATTN_PV"| Multiply attention probabilities by values
"TATTN_MHA"| Execute fused MHA operation
"TATTN_GQA"| Execute GQA operation
"TATTN_MLA"| Execute MLA-oriented operation

These operations may be decomposed into smaller operations when a specialized fused engine is unavailable.

The architecture must support streaming execution and avoid unnecessary movement of attention intermediates.

7.11 Softmax and Normalization

Transformer workloads require normalization operations.

Proposed instructions:

Mnemonic| Description
"TSOFTMAX"| Softmax
"TLOGSOFTMAX"| Log-softmax
"TLAYERNORM"| Layer normalization
"TRMSNORM"| Root Mean Square normalization
"TREDUCE_SUM"| Tensor sum reduction
"TREDUCE_MAX"| Tensor maximum reduction

The numerical semantics must specify accumulation precision, approximation policy and reproducibility requirements.

Approximate implementations must have documented error bounds.

7.12 Activation Instructions

The architecture proposes hardware-assisted or fused activation operations.

Mnemonic| Description
"TRELU"| ReLU
"TGELU"| GELU
"TSILU"| SiLU / Swish
"TSIGMOID"| Sigmoid
"TTANH"| Hyperbolic tangent
"TSWISH"| Swish activation

The implementation may use approximation algorithms.

Each approximation must have a documented accuracy target and validation methodology.

The ISA must distinguish exact architectural behavior from implementation-defined approximation where necessary.

7.13 Quantization Instructions

Quantization is a major component of AI performance and memory efficiency.

Proposed operations:

Mnemonic| Description
"TQUANT"| Quantize tensor values
"TDEQUANT"| Dequantize tensor values
"TREQUANT"| Requantize between formats
"TQUANT_SCALE"| Apply quantization scale
"TQUANT_ZEROPOINT"| Apply zero-point adjustment
"TPACK"| Pack low-bit values
"TUNPACK"| Unpack low-bit values

The architecture must define:

- Scale representation.
- Zero-point representation.
- Per-tensor quantization.
- Per-channel quantization.
- Block quantization.
- Rounding mode.
- Saturation behavior.
- Packed-data layout.

Quantization metadata must remain compatible with the compiler and runtime.

7.14 Tensor Memory and Data Movement

Tensor execution must be coordinated with the MEMORY domain.

The architecture proposes:

- Local SRAM tile buffers.
- Double buffering.
- Asynchronous DMA transfers.
- Prefetching.
- Tensor layout transformation.
- Distributed tensor movement.
- Overlapped memory and compute execution.

The ISA may expose high-level asynchronous operations while the microarchitecture manages physical transfers.

Tensor instructions must define completion dependencies before results are consumed by another execution domain.

7.15 Tensor Synchronization

Tensor operations may execute asynchronously.

The architecture requires explicit mechanisms for:

- Operation completion.
- Accumulator visibility.
- Tile synchronization.
- Dependency tracking.
- Error reporting.
- Cancellation where supported.

The final synchronization interface must integrate with the CONCURRENT execution domain.

7.16 Numerical Determinism

Numerical determinism is a major architectural requirement.

The N300 specification must distinguish:

1. Bit-exact operations.
2. IEEE-compatible operations.
3. Architecturally defined approximate operations.
4. Implementation-defined operations.

For reproducible execution, the ISA must define the relevant numerical behavior, including accumulation and rounding policies.

The Golden Emulator must become the reference for every frozen numerical instruction.

7.17 Performance Objectives

The TENSOR domain should prioritize:

- Maximum matrix throughput.
- High utilization of specialized compute engines.
- Efficient mixed-precision execution.
- High accumulator bandwidth.
- Low data-movement overhead.
- Sparse execution efficiency.
- Attention and MoE acceleration.
- Concurrent execution across independent tensor workloads.

Performance targets must be validated using representative models, not theoretical peak throughput alone.

7.18 Open Architectural Decisions

The following items remain open:

1. Supported matrix tile dimensions.
2. Exact matrix accumulator formats.
3. Accumulator capacity.
4. FP6 and FP4 numerical definitions.
5. INT2 arithmetic semantics.
6. Ternary representation and execution model.
7. Sparse metadata formats.
8. MoE routing and dispatch semantics.
9. MHA, GQA and MLA operation decomposition.
10. Softmax and normalization accuracy targets.
11. Quantization metadata layout.
12. Tensor instruction encoding.
13. Asynchronous completion semantics.
14. Physical Matrix Engine organization.

7.19 Section 7 Acceptance Criteria

Section 7 may only be frozen after:

- Tensor data types are fully specified.
- Matrix instruction semantics are defined.
- Accumulator behavior is documented.
- Tiling rules are established.
- Sparse execution semantics are defined.
- Attention and MoE interfaces are validated.
- Quantization behavior is specified.
- Numerical reproducibility requirements are established.
- A bit-exact Golden Emulator supports mandatory operations.
- RTL matches the architectural reference model.
- Representative AI workloads pass verification.
- Roofline and physical performance measurements are available.

Current status: DRAFT / PROPOSED — NOT FROZEN.

No opcode assignments are authorized by this section.

---

End of Section 7 — TENSOR Instructions

Section 8 — MEMORY Instructions

Architecture: AINeuronX N300-SINGULARITY
Document: N300_ISA_SPECIFICATION.md
Version: 0.2 DRAFT
Status: PROPOSED — NOT FROZEN
ISA Family: MEMORY

---

8.1 Purpose

The MEMORY instruction family defines how N300 compute engines access, transfer, synchronize, and manage data across the memory hierarchy.

The architecture must prevent memory bandwidth and data movement from becoming bottlenecks for matrix, vector, attention, sparse, and agent workloads.

The memory architecture is designed to support:

- Low-latency local SRAM access.
- High-bandwidth shared memory.
- External DDR and HBM memory.
- Distributed memory across multiple compute tiles.
- Asynchronous DMA transfers.
- Multidimensional tensor data movement.
- Prefetch and double buffering.
- Explicit synchronization and memory ordering.
- Atomic operations and concurrent execution.
- Memory protection and isolation.

The ISA defines architectural behavior. Physical memory organization, cache sizes, port counts, and implementation details remain microarchitectural decisions.

8.2 Memory Hierarchy

N300 proposes a hybrid memory hierarchy.

Level| Memory type| Architectural purpose
L0| Registers| Immediate operand storage
L1| Local SRAM| Low-latency tile-local data
L2| Shared SRAM| Shared working data across compute engines
L3| External DDR/HBM| Large-capacity high-bandwidth memory
L4| Distributed memory| Data across multiple tiles, chiplets, or nodes

These labels describe logical memory levels. They do not mandate a particular cache architecture or physical implementation.

8.2.1 L0 — Register Storage

Register storage includes:

- Scalar registers.
- Vector registers.
- Predicate registers.
- Tensor accumulator registers.
- Architectural control and status registers.

Register accesses are governed by their respective instruction families.

8.2.2 L1 — Local SRAM

Local SRAM provides fast storage close to compute engines.

Primary uses:

- Matrix operand staging.
- Vector working sets.
- Attention blocks.
- KV cache tiles.
- Sparse metadata.
- Intermediate tensor results.

The ISA must allow explicit data movement into and out of local SRAM.

8.2.3 L2 — Shared SRAM

Shared SRAM provides a larger working area accessible to multiple compute engines or execution contexts, subject to access permissions.

Primary uses:

- Shared tensor blocks.
- Inter-engine communication.
- Intermediate computation results.
- Synchronization buffers.
- Shared agent data.

The implementation may use banks, multiple ports, arbitration, and hardware-managed allocation.

8.2.4 L3 — External Memory

External memory supports large working sets through DDR or HBM interfaces.

Primary uses:

- Model weights.
- Large tensors.
- Training datasets.
- Activations.
- KV cache backing storage.
- Checkpoints and persistent computation state.

The ISA must support efficient transfers between external memory and on-chip storage.

8.2.5 L4 — Distributed Memory

Distributed memory extends the memory model across compute tiles, chiplets, and potentially multiple N300 devices.

Primary uses:

- Distributed tensor operations.
- Multi-device inference.
- Model parallelism.
- Expert parallelism.
- Collective communication.
- Distributed KV cache management.

Remote access latency and consistency requirements must be explicitly represented in the architecture.

---

8.3 Address Spaces

The N300 memory model proposes logically distinct address spaces:

- "GLOBAL": externally accessible system memory.
- "LOCAL": tile-local SRAM.
- "SHARED": shared on-chip memory.
- "DISTRIBUTED": memory accessible through distributed compute infrastructure.
- "PRIVATE": execution-context-private memory.
- "IO": memory-mapped device and peripheral regions.

These address spaces are logical classifications. Their actual physical mappings are implementation-defined.

Each memory access must respect:

- Address validity.
- Access permissions.
- Alignment requirements.
- Memory-region attributes.
- Execution-context isolation.
- Security boundaries.

The ISA must provide a consistent mechanism for translating or resolving architectural addresses into physical memory locations.

---

8.4 Memory Instruction Categories

The MEMORY instruction family is divided into the following groups:

1. Scalar memory access.
2. Vector memory access.
3. Tensor memory access.
4. DMA and asynchronous transfers.
5. Prefetch and data movement.
6. Memory synchronization and ordering.
7. Atomic operations.
8. Memory protection and control.
9. Distributed memory operations.
10. KV cache and specialized memory management.

No final opcode assignments are defined in this draft.

---

8.5 Scalar Memory Instructions

Proposed scalar operations:

Instruction| Purpose
"LD"| Load scalar data
"ST"| Store scalar data
"LD8"| Load 8-bit value
"LD16"| Load 16-bit value
"LD32"| Load 32-bit value
"LD64"| Load 64-bit value
"LD_SIGNED"| Load with sign extension
"LD_UNSIGNED"| Load with zero extension
"ST8"| Store 8-bit value
"ST16"| Store 16-bit value
"ST32"| Store 32-bit value
"ST64"| Store 64-bit value

The final set of widths must be aligned with the frozen scalar register width and supported data types.

8.5.1 Scalar Access Requirements

Scalar loads and stores must define:

- Effective address calculation.
- Alignment behavior.
- Access width.
- Signed or unsigned interpretation.
- Memory permissions.
- Fault reporting.
- Ordering behavior.

Unaligned accesses must have explicitly defined architectural behavior. Their implementation may require multiple physical transactions.

---

8.6 Vector Memory Instructions

Vector memory operations provide efficient access to vector data.

Proposed instructions:

Instruction| Purpose
"VLOAD"| Load vector elements
"VSTORE"| Store vector elements
"VLOAD_MASKED"| Load selected elements
"VSTORE_MASKED"| Store selected elements
"VGATHER"| Gather elements using indices
"VSCATTER"| Scatter elements using indices
"VLOAD_STRIDED"| Load using a configurable stride
"VSTORE_STRIDED"| Store using a configurable stride
"VPREFETCH"| Request vector data prefetch

Vector memory operations must support the architectural vector configuration defined in Section 6.

The execution model must define:

- Active vector length.
- Element width.
- Mask behavior.
- Stride interpretation.
- Address generation.
- Partial completion.
- Fault handling.

Masked-off elements must not perform architecturally visible memory accesses unless explicitly specified by a future instruction definition.

---

8.7 Tensor Memory Instructions

Tensor memory operations support multidimensional data access and efficient movement of tensor blocks.

Proposed instructions:

Instruction| Purpose
"TLOAD"| Load tensor data
"TSTORE"| Store tensor data
"TLOAD_TILE"| Load a tensor tile
"TSTORE_TILE"| Store a tensor tile
"TLOAD_BLOCK"| Load a multidimensional block
"TSTORE_BLOCK"| Store a multidimensional block
"TLOAD_TRANSPOSE"| Load with transpose transformation
"TSTORE_TRANSPOSE"| Store with transpose transformation
"TLOAD_STRIDED"| Load using multidimensional strides
"TSTORE_STRIDED"| Store using multidimensional strides

8.7.1 Tensor Descriptor

A tensor memory descriptor may contain:

- Base address.
- Data type.
- Dimensions.
- Element size.
- Strides.
- Tile dimensions.
- Memory address space.
- Layout information.
- Access permissions.
- Optional boundary and padding metadata.

The final descriptor format remains open.

8.7.2 Tensor Layout Support

The architecture should support:

- Row-major layouts.
- Column-major layouts.
- Blocked layouts.
- Tiled layouts.
- Strided layouts.
- Specialized layouts for attention and matrix computation.

Hardware may support additional optimized physical layouts without exposing them as separate architectural data types.

---

8.8 DMA Instructions

Direct Memory Access is a fundamental component of N300.

DMA must enable data transfers independently of the main compute execution path, allowing computation and data movement to overlap.

Proposed instructions:

Instruction| Purpose
"DMA_CONFIG"| Configure a DMA operation
"DMA_LOAD"| Transfer data into local memory
"DMA_STORE"| Transfer data to another memory level
"DMA_COPY"| Copy data between supported memory regions
"DMA_2D"| Perform two-dimensional transfer
"DMA_3D"| Perform three-dimensional transfer
"DMA_START"| Start an asynchronous transfer
"DMA_WAIT"| Wait for transfer completion
"DMA_STATUS"| Read transfer status
"DMA_CANCEL"| Request cancellation where supported

8.8.1 DMA Descriptor

A DMA descriptor may include:

- Source address.
- Destination address.
- Transfer size.
- Element size.
- Number of dimensions.
- Source strides.
- Destination strides.
- Tile dimensions.
- Transfer direction.
- Completion identifier.
- Priority.
- Optional security and protection attributes.

The descriptor layout and maximum transfer dimensions are not frozen.

8.8.2 Asynchronous DMA

DMA operations should support asynchronous execution.

The expected sequence is:

1. Configure the transfer.
2. Submit the DMA request.
3. Continue independent computation.
4. Check or wait for completion.
5. Consume the transferred data after the required synchronization.

The ISA must prevent consumers from observing incomplete transfer results.

8.8.3 DMA and Compute Overlap

N300 must support overlapping:

- DMA input transfers.
- Matrix computation.
- Vector computation.
- DMA output transfers.

The microarchitecture should provide multiple independent execution resources where necessary.

The goal is to minimize idle compute cycles caused by memory movement.

8.8.4 Double Buffering

The architecture must support software-controlled or hardware-assisted double buffering.

A typical execution sequence:

- Buffer A is consumed by the compute engine.
- Buffer B receives the next data block through DMA.
- The buffers exchange roles after synchronization.
- The process continues while data and computation remain available.

The implementation may support deeper buffering beyond two buffers.

---

8.9 Prefetch Instructions

Prefetch operations request data movement before the corresponding computation requires the data.

Proposed instructions:

Instruction| Purpose
"PREFETCH"| Request data prefetch
"PREFETCH_L1"| Request local SRAM prefetch
"PREFETCH_L2"| Request shared-memory prefetch
"PREFETCH_TENSOR"| Request tensor-block prefetch
"PREFETCH_KV"| Request KV cache data prefetch

Prefetch instructions are advisory unless a future specification explicitly defines stronger completion guarantees.

A prefetch request must not silently override memory protection or access permissions.

The implementation may ignore prefetch requests when resources are unavailable.

---

8.10 Memory Synchronization and Ordering

N300 supports concurrent execution across multiple compute engines and agent contexts.

Memory synchronization must therefore be explicitly defined.

Proposed instructions:

Instruction| Purpose
"MEM_FENCE"| Enforce a memory ordering boundary
"LOAD_FENCE"| Order memory load operations
"STORE_FENCE"| Order memory store operations
"DMA_FENCE"| Synchronize relevant DMA operations
"MEM_SYNC"| Synchronize memory operations
"MEM_WAIT"| Wait for a memory event or completion
"MEM_BARRIER"| Coordinate participating execution contexts

8.10.1 Memory Ordering Model

The architecture must define a formal memory consistency model.

The model must specify:

- Ordering of loads and stores.
- Visibility of writes across execution contexts.
- Ordering of DMA operations relative to compute operations.
- Synchronization between local and shared memory.
- Ordering of distributed memory transactions.
- Atomic operation visibility.

A weakly ordered model with explicit synchronization is a possible implementation direction, but the final architectural contract must be established before the ISA is frozen.

8.10.2 Barrier Semantics

Barriers must define:

- Participating execution contexts.
- Barrier identity.
- Arrival conditions.
- Completion conditions.
- Timeout or failure behavior, if supported.

A barrier must not be assumed to synchronize unrelated execution contexts unless explicitly configured.

---

8.11 Atomic Memory Instructions

Atomic operations enable safe concurrent updates to shared data.

Proposed instructions:

Instruction| Purpose
"AMO_ADD"| Atomic addition
"AMO_SUB"| Atomic subtraction
"AMO_AND"| Atomic AND
"AMO_OR"| Atomic OR
"AMO_XOR"| Atomic XOR
"AMO_SWAP"| Atomic exchange
"AMO_MIN"| Atomic minimum
"AMO_MAX"| Atomic maximum
"CAS"| Compare-and-swap
"FETCH_ADD"| Atomic fetch and add

The architecture must define supported atomic widths, alignment, ordering modes, and memory regions.

Atomic operations must be compatible with the concurrency model and must not violate execution-context isolation.

Support for distributed atomics remains an open architectural decision.

---

8.12 Distributed Memory Instructions

Distributed memory operations enable communication between tiles, chiplets, and supported N300 devices.

Proposed instructions:

Instruction| Purpose
"DMEM_LOAD"| Read distributed memory
"DMEM_STORE"| Write distributed memory
"DMEM_COPY"| Transfer data between distributed regions
"DMEM_PREFETCH"| Request remote data
"DMEM_SEND"| Send data to a remote execution domain
"DMEM_RECV"| Receive data from a remote execution domain
"DMEM_SYNC"| Synchronize distributed memory activity
"DMEM_WAIT"| Wait for distributed operation completion

Distributed operations must define:

- Destination identity.
- Remote address.
- Transfer size.
- Completion semantics.
- Error handling.
- Security and access permissions.
- Ordering guarantees.

The ISA must not assume that remote memory has the same latency or consistency properties as local SRAM.

8.12.1 Multi-Device Support

The architecture should support future multi-device configurations through a defined communication and memory-access abstraction.

Physical interconnects and transport protocols remain implementation-specific.

---

8.13 KV Cache Memory Instructions

Attention workloads require efficient management of large key-value caches.

N300 proposes specialized architectural operations to support KV cache allocation, movement, and access.

Proposed instructions:

Instruction| Purpose
"KV_ALLOC"| Allocate KV cache storage
"KV_FREE"| Release KV cache storage
"KV_LOAD"| Load KV cache data
"KV_STORE"| Store KV cache data
"KV_APPEND"| Append new key/value entries
"KV_GATHER"| Gather selected cache entries
"KV_PREFETCH"| Request cache prefetch
"KV_COMPACT"| Compact cache storage
"KV_SYNC"| Synchronize KV cache operations

The architectural model should support:

- Variable sequence lengths.
- Multiple attention heads.
- Grouped-query attention.
- Multi-query attention.
- Multi-head latent attention.
- Paged or block-based cache organizations.
- Cache sharing where permitted.
- Isolation between independent execution contexts.

The final KV cache representation is a microarchitectural and runtime decision.

These instructions are proposed architectural operations, not evidence that a dedicated KV cache engine has already been implemented.

---

8.14 Memory Protection and Security

Memory operations must respect the N300 security architecture.

The ISA must provide mechanisms to enforce:

- Execution-context isolation.
- Address-space permissions.
- Read/write restrictions.
- DMA access protection.
- Distributed-memory access control.
- Secure memory regions.
- Fault detection and reporting.

A DMA engine must not be allowed to bypass the access permissions of its execution context.

Memory protection must remain effective across asynchronous operations and context switches.

The implementation should integrate with the N300 security architecture, including its Root of Trust and secure execution mechanisms.

---

8.15 Memory Faults and Exceptions

Memory operations must define deterministic architectural fault behavior.

Potential fault categories include:

- Invalid address.
- Address misalignment.
- Permission violation.
- Unmapped memory region.
- DMA transfer failure.
- Distributed access failure.
- Memory integrity error.
- ECC-detected error.
- Descriptor validation failure.
- Unsupported memory operation.

The architecture must define:

- Fault identification.
- Fault reporting.
- Destination register behavior.
- Partial transfer behavior.
- Completion status.
- Recovery or termination rules.

The exact exception encoding and recovery mechanisms remain open.

---

8.16 Performance Requirements

The MEMORY instruction family must enable the following architectural capabilities:

1. Independent DMA and compute execution.
2. Multidimensional data transfers.
3. Efficient tensor tile movement.
4. Local SRAM utilization.
5. Shared-memory communication.
6. Asynchronous prefetch.
7. Double and multi-buffering.
8. Memory synchronization.
9. Distributed data movement.
10. KV cache management.

Performance targets must be measured at the microarchitectural level.

The ISA alone does not guarantee bandwidth, latency, occupancy, or throughput.

N300 performance evaluation must include:

- Sustained memory bandwidth.
- Effective bandwidth under concurrent workloads.
- DMA throughput.
- DMA/compute overlap.
- Local SRAM utilization.
- Memory access latency.
- Bank conflict behavior.
- NoC congestion.
- Distributed transfer overhead.
- Compute-engine stall cycles caused by memory dependencies.

---

8.17 Compiler and Runtime Integration

The N300 compiler and runtime must translate high-level memory operations into legal ISA sequences.

Required software components include:

- Memory layout analysis.
- Address-space management.
- Tensor descriptor generation.
- DMA scheduling.
- Automatic prefetch insertion.
- Double-buffer management.
- Memory dependency analysis.
- Synchronization insertion.
- Memory allocation and lifetime tracking.
- Distributed placement.
- KV cache allocation and scheduling.

NANO IR should represent memory dependencies and transfer operations explicitly.

The compiler must not remove or reorder memory operations in ways that violate the architectural memory consistency model.

The runtime must validate descriptors and enforce resource and security constraints.

---

8.18 Open Architectural Decisions

The following decisions remain open:

Decision| Current status
Physical SRAM capacity| Not frozen
SRAM banking and port configuration| Not frozen
DDR/HBM interface configuration| Not frozen
Cache architecture| Not frozen
Address width| Not frozen
Address-space encoding| Not frozen
Memory consistency model| Not frozen
Atomic operation widths| Not frozen
DMA descriptor format| Not frozen
Maximum DMA dimensions| Not frozen
DMA queue architecture| Not frozen
Number of DMA engines| Not frozen
Prefetch behavior| Not frozen
Distributed memory protocol| Not frozen
Distributed atomic support| Not frozen
KV cache physical organization| Not frozen
ECC implementation| Not frozen
Fault and recovery semantics| Not frozen

These decisions must be resolved through architecture analysis, simulation, performance modeling, and implementation validation.

---

8.19 Acceptance Criteria

The MEMORY instruction family cannot be considered architecturally complete until:

1. All scalar memory operations have defined semantics.
2. Vector memory behavior is consistent with Section 6.
3. Tensor memory behavior is consistent with Section 7.
4. Address-space rules are documented.
5. DMA descriptor semantics are specified.
6. Asynchronous completion behavior is deterministic.
7. DMA/compute synchronization is formally defined.
8. Memory ordering rules are documented.
9. Atomic operations have defined semantics.
10. Memory protection applies to all supported access paths.
11. Memory faults have defined architectural behavior.
12. Distributed-memory operations have defined completion and error semantics.
13. The Golden Emulator implements the supported architectural behavior.
14. The compiler and runtime can generate and execute valid memory operations.
