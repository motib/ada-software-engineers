with Ada.Text_IO; use Ada.Text_IO;
package body Inst is
  procedure Print_Instruction(I: Instruction) is
  begin
    Put_Line(Operators'Image(I.Op_Code) & Byte'Image(I.Operand));
  end Print_Instruction;
end Inst;
