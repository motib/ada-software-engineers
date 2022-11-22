package Inst is
  type Operators is (Op0, Op1, Op2, Op3, Op4, Op5, Op6, Op7);
  type Byte is mod 256;
  type Instruction is
    record
      Op_Code: Operators;
      Operand: Byte range 0..31;
    end record;
  procedure Print_Instruction(I: Instruction);
end Inst;
