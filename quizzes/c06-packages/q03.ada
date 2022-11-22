package P is
  type T is limited private;
  type Array_Type is array(0..10) of T;
  procedure Proc;
private
  type T is
    record
      X: Integer := 0;
    end record;
end P;

package body P is
  A1, A2: Array_Type;
  procedure Proc is
  begin
    A1 := A2;
  end Proc;
end P;


with P;
procedure Main is
  A1, A2: P.Array_Type;
begin
  A1 := A2;
end Main;

