procedure Main is
  type Rec is
    record
      One, Two, Three, Four, Five: Integer;
    end record;
  R: Rec := (1, 2, Four=>4, Five=>5, Three=>3);

  type Vector is array(1..5) of Integer;
  V: Vector := (1, 2, 3=>3, 4=>4, 5=>5);
begin
  null;
end Main;

