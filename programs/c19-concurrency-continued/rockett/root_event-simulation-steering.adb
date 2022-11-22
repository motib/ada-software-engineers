with Ada.Text_IO; use Ada.Text_IO;
package body Root_Event.Simulation.Steering is

  procedure Simulate(E: in Steering_Event) is
  begin 
    Put("Time " & Integer'Image(E.Time) & ": "); 
    Put_Line("Steering command " &
             Commands'Image(E.Command) & " to " &
             Integer'Image(E.Degree) & " degrees");
  end Simulate;

end Root_Event.Simulation.Steering;
