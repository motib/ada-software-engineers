package P is
  type T1 is tagged 
    record I: Integer := 0; end record;
  type T2 is new T1 with 
    record N: Integer := 0; end record;
end P;

with P; use P; 
procedure Main is
  A: T2'Class := (I => 2, N => 4);
begin
  null;
end Main;

