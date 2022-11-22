package body Root_Event is
  function "<"(Left, Right: Event'Class) return Boolean is
  begin
    return Left.Time < Right.Time;
  end "<";

  procedure Set_Size(D: in out Displayed_Event; N: Natural) is
  begin
    D.Size := N;
  end Set_Size;

  function Get_Size(D: Displayed_Event) return Natural is
  begin
    return D.Size;
  end Get_Size;
end Root_Event;
