--
-- Derived type for change of representation.
--
with Ada.Text_IO; use Ada.Text_IO;
procedure Rep is
  type Operators is (Op0, Op1, Op2, Op3, Op4, Op5, Op6, Op7);
  type Byte is mod 256;
  type Instruction is
    record
      Op_Code: Operators;
      Operand: Byte range 0..31;
    end record;

  type Packed_Instruction is new Instruction;
  for Packed_Instruction use
    record
      Op_Code at 0 range 0..2;
      Operand at 0 range 3..7;
    end record;
  for Packed_Instruction'Size use 8;

  PI: Packed_Instruction := (Op3, 26);
  I: Instruction := Instruction(PI);
begin
  Put(Operators'Image(PI.Op_Code));
  Put(Byte'Image(PI.Operand));
  New_Line;
  Put(Operators'Image(I.Op_Code));
  Put(Byte'Image(I.Operand));
end Rep;
