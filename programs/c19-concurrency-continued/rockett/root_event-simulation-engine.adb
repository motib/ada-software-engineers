with Ada.Text_IO; use Ada.Text_IO;
package body Root_Event.Simulation.Engine is

  procedure Put_Data(E: Engine_Event; Engine_ID: String; Thrust: Integer) is
  begin
    Put("Time " & Integer'Image(E.Time) & ": "); 
    Put(Engine_ID);
    Put_Line(" engine fuel " & Integer'Image(E.Fuel) &
             " L, oxygen " & Integer'Image(E.Oxygen) &
             " L, produced " & Integer'Image(Thrust) &
             " KG thrust");
  end;
  
  procedure Simulate(E: in Engine_Event) is
  begin 
    Put_Data(E, "Main", E.Fuel * E.Oxygen);
  end Simulate;

  procedure Simulate(E: in Aux_Engine_Event) is
  begin 
    Put_Data(Engine_Event(E), 
             Aux_Engine_ID'Image(E.Side), 
             E.Fuel * E.Oxygen / 2);
  end Simulate;

end Root_Event.Simulation.Engine;
