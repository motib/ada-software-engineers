
package body Root_Event is

  -- Implement class wide operation.
  function "<"(Left, Right: Event'Class) return Boolean is
  begin
    return Left.Time < Right.Time;
  end "<";

end Root_Event;
