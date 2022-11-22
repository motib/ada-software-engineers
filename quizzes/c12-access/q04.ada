with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
  type String_Ptr is access String;
  S: String_Ptr := new String'("Hello world");
  type Integer_Ptr is access Integer;
  I: Integer_Ptr := new Integer'(10);
begin
  Put_Line(S(1..5));
  Put(I);
end Main;

