
with Ada.Text_IO; use Ada.Text_IO;
package body Root_Event.Engine is
  function Create(F, O: Natural) return Event_Ptr is
    E: Engine_Ptr := new Engine_Event;
  begin
    E.Fuel := F; E.Oxygen := O;
    return Event_Ptr(E);
  end Create;
  procedure Simulate(E: in Engine_Event) is
  begin
    Put_Line("Engine fuel " & Integer'Image(E.Fuel) &
             " L, oxygen " & Integer'Image(E.Oxygen) & " L");
  end Simulate;
end Root_Event.Engine;
