with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  File: File_Type;
  procedure Get_Data(F: in File_Type) is
  begin
    Open(F, In_File, "name.txt");
    Close(F);  
  end Get_Data;
begin
  Get_Data(File);
end Main;
