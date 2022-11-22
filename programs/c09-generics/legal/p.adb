package body P is
  type T3 is new Parent with
    record
      X: Component_Type;
    end record;
  procedure Proc(A: T1) is
  begin
    null;
  end Proc;
end P;
