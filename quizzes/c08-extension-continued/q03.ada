package P is
  type T1 is tagged 
    record I: Integer; end record;
  function F return T1;

  type T2 is new T1 with
    record N: Integer; end record;
end P;

