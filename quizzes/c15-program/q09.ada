with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Bounded;
procedure Main is
  package Names is new Ada.Strings.Bounded.Generic_Bounded_Length(16);
  Hello:  String := "Hello";
  use type Names.Bounded_String;
begin
  Put_Line(Names.To_String(2 * Hello));
  Put_Line(2 * Hello);
end Main;
