package P is
  type T1 is tagged 
    record 
      N: Integer; 
    end record;
  procedure Proc1(X: T1);
  Empty: constant T1;
  procedure Proc2(X: T1);
private
  Empty: constant T1 := (N => 1);
end P;

