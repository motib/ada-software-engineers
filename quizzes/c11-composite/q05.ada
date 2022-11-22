procedure Main is
  subtype S is Integer range 0..127;
  type T(First: S := 0; Second: S) is
    record
      C1: S := First;
      C2: S := Second;
    end record;
begin
  null;
end Main;
