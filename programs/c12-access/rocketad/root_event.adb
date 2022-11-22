
package body Root_Event is
  function "<"(Left, Right: Event'Class) return Boolean is
  begin
    return Left.Time < Right.Time;
  end "<";
end Root_Event;
