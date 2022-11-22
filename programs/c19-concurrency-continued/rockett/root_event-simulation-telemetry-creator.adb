
package body Root_Event.Simulation.Telemetry.Creator is

  task body Create is
  
    function Create_Event return Telemetry_Event is
    begin
      return (
        Time   => Random_Update(P), 
        ID     => Subsystems'Val(Random(P.all) mod (Subsystems'Pos(Subsystems'Last)+1)),
        Status => States'Val(Random(P.all) mod (States'Pos(States'Last)+1))
        );
    end Create_Event;
    
  begin
    loop
      Put(Create_Event, P.all);
      delay 1.0;
    end loop;
  end Create;

end Root_Event.Simulation.Telemetry.Creator;
