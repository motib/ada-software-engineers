with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

  N1: Integer := 5;
  type Ptr is access Integer;
  N2: Ptr := new Integer'(5);

  procedure Proc(K: out Integer; P: out Ptr) is
  begin
    Put_Line(Integer'Image(K));
    Put_Line(Integer'Image(P.all));
  end Proc;

begin
  Proc(N1, N2);
end Main;

