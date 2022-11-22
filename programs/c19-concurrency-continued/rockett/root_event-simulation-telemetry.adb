with Ada.Text_IO; use Ada.Text_IO;
package body Root_Event.Simulation.Telemetry is

  procedure Simulate(E: in Telemetry_Event) is
  begin 
    Put("Time " & Integer'Image(E.Time) & ": "); 
    Put_Line("Telemetry message " & 
             Subsystems'Image(E.ID) & " " &
             States'Image(E.Status));
  end Simulate;

end Root_Event.Simulation.Telemetry;
