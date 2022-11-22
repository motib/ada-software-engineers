with Ada.Tags;
with Ada.Text_IO;
with Root_Event.Random_Time;
package body Root_Event is
  G: Random_Time.Generator;

  function  Create return Event is
  begin
    return (Time =>   Random_Time.Random(G));
  end Create;

  procedure Simulate(E: in Event) is
  begin
    Ada.Text_IO.Put("Time " & Integer'Image(E.Time) & ": "); 
  end Simulate;

  function  Format(D: Event) return String is
  begin
    return Ada.Tags.External_Tag(Event'Class(D)'Tag);
  end Format;

  -- Implement class wide operation.
  function "<"(Left, Right: Event'Class) return Boolean is
  begin
    return Left.Time < Right.Time;
  end "<";
begin
  Random_Time.Reset(G);
end Root_Event;
