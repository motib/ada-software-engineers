with Ada.Text_IO; use Ada.Text_IO;
with Ada.IO_Exceptions;
procedure Main is
  File: File_Type;
begin
  Open(File, In_File, "name.txt");
exception
  when Name_Error => Put_Line("File not found");
end Main;
