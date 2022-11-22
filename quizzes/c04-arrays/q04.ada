procedure Main is
  type Vector is array(Integer range <>) of Integer;
  V1: Vector(1..5) := (6..10 => 0);
  V2: Vector(1..5) := (6 => 1, others => 0);
begin
  null;
end Main;

