with Inst;
procedure Rep1 is
  type Packed_Instruction is new Inst.Instruction;
  for Packed_Instruction use
    record
      Op_Code at 0 range 0..2;
      Operand at 0 range 3..7;
    end record;
  for Packed_Instruction'Size use 8;

  PI: Packed_Instruction := (Inst.Op3, 26);
  I:  Inst.Instruction := Inst.Instruction(PI);
begin
  Inst.Print_Instruction(I);
  Print_Instruction(PI);
end Rep1;
