with Ada.Text_IO;
procedure Main is
  X: String := "abcd";
  procedure P(S: String) is
  begin
    for I in S'Range loop
      Ada.Text_IO.Put_Line(S(I) & '*');
    end loop;
  end P;
begin
  P(X(1..0));
end Main;
