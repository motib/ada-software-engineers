package P is
  type T1 is private;
  C: constant T1;
  V: T1;
private
  type T1 is new Integer;
  C: constant T1 := 0;
end P;

