package P is
  type T1 is tagged null record;
  procedure Proc1(X: in out T1);

  type T2 is new T1 with null record;
  procedure Proc1(X: in out T2);
  procedure Proc2(X: in out T1);
end P;

