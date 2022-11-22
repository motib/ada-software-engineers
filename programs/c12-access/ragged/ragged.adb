with Ada.Text_IO;
procedure Ragged is
  OK_EN:     aliased constant String := "OK";
  Apply_EN:  aliased constant String := "Apply";
  Help_EN:   aliased constant String := "Help";
  Cancel_EN: aliased constant String := "Cancel";

  type Label_Ptr is not null access constant String;

  Labels: constant array(Natural range <>) of Label_Ptr :=
    (OK_EN'Access, Apply_EN'Access, Help_EN'Access, Cancel_EN'Access);
begin
  for L in Labels'Range loop
    Ada.Text_IO.Put_Line(Labels(L).all);
  end loop;
end Ragged;
