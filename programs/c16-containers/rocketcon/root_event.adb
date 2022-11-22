package body Root_Event is

  Number: Event_Number := 0;

  -- Implement class wide operation.
  function Get_Number return Event_Number is
  begin
    Number := Number + 1;
    return Number;
  end Get_Number;
  
  function "<"(Left, Right: Event'Class) return Boolean is
  begin
    return Left.Time < Right.Time or
           (Left.Time = Right.Time and Left.Number < Right.Number);
  end "<";

  function "="(Left, Right: Event'Class) return Boolean is
  begin
    return Left.Time = Right.Time and Left.Number = Right.Number;
  end "=";

end Root_Event;
