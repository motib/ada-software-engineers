
with Ada.Text_IO; use Ada.Text_IO;
package body Root_Event.Telemetry is
  function Create(Sub: Subsystems; St: States) return Event_Ptr is
    E: Telemetry_Ptr := new Telemetry_Event;
  begin
    E.ID := Sub; E.Status := St;
    return Event_Ptr(E);
  end Create;
  procedure Simulate(E: in Telemetry_Event) is
  begin 
    Put_Line("Telemetry message " & 
             Subsystems'Image(E.ID) & " " &
             States'Image(E.Status));
  end Simulate;
end Root_Event.Telemetry;
