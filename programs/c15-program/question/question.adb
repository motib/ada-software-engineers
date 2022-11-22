with P;
use type P.T;
with Ada.Text_IO; use Ada.Text_IO;
procedure Question is
  V: P.T := P.B;
begin
   if V = P.A then
      Put_Line("A");
   else
      Put_Line("not A");
   end if;
end Question;

