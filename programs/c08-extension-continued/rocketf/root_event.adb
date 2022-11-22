
package body Root_Event is

  function Another(Original: Event; Copy: Event) return Event'Class is
  begin
    return Event'Class(Copy);
  end Another;

  -- Implement class wide operation.
  function "<"(Left, Right: Event'Class) return Boolean is
  begin
    return Left.Time < Right.Time;
  end "<";

end Root_Event;
