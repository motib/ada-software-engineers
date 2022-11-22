package P is
  type T1 is tagged 
    record 
      N: Integer; 
    end record;
  procedure Proc2(X: T1 := (N=>1));
end P;

