with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type My_Boolean is new Boolean;
  I, J: Integer := 1;
  M: My_Boolean := My_Boolean(I = J);
begin
  if M then Put("Equal"); else Put("Not equal"); end if;
end Main;

