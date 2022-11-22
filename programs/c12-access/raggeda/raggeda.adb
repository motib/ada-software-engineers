with Ada.Text_IO;
procedure RaggedA is
  OK_EN:     aliased constant String := "OK";
  Apply_EN:  aliased constant String := "Apply";
  Help_EN:   aliased constant String := "Help";
  Cancel_EN: aliased constant String := "Cancel";

  Labels: constant array(Natural range <>) of 
    not null access constant String :=
      (OK_EN'Access, Apply_EN'Access, Help_EN'Access, Cancel_EN'Access);
begin
  for L in Labels'Range loop
    Ada.Text_IO.Put_Line(Labels(L).all);
  end loop;
end RaggedA;
