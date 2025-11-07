/// Represents the type of logic gate
enum GateType {
  /// AND gate: output is 1 only when both inputs are 1
  and,

  /// OR gate: output is 1 when at least one input is 1
  or,

  /// NOT gate: output is the inverse of input A
  not,

  /// NAND gate: output is 0 only when both inputs are 1
  nand,

  /// NOR gate: output is 1 only when both inputs are 0
  nor,

  /// XOR gate: output is 1 when inputs are different
  xor,

  /// XNOR gate: output is 1 when inputs are the same
  xnor,
}
