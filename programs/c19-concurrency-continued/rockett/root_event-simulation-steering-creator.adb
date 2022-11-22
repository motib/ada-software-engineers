package body Root_Event.Simulation.Steering.Creator is

  task body Create is
      
    function Create_Event return Steering_Event is
    begin
      return (
        Time   => Random_Update(P), 
        Command => Commands'Val(Random(P.all) mod (Commands'Pos(Commands'Last)+1)),
        Degree  => (Random(P.all) mod 181) - 90
        );
    end Create_Event;
    
  begin
    loop
      Put(Create_Event, P.all);
      delay 1.0;
    end loop;
  end Create;

end Root_Event.Simulation.Steering.Creator;
