package body Root_Event.Simulation.Engine.Creator is

  task body Create is
    
  function Create_Event return Engine_Event'Class is
    E: Engine_Event := (
        Time   => Random_Update(P),
        Fuel   => Random(P.all) mod 100, 
        Oxygen => Random(P.all) mod 500);
    begin
      if Random(P.all) mod 3 = 0 then
        return Main_Engine_Event'(E with null record);
      else
        return Aux_Engine_Event'(E with
          Aux_Engine_ID'Val(Random(P.all) mod 2));
      end if;
    end Create_Event;
    
  begin
    loop
      Put(Create_Event, P.all);
      delay 1.0;
    end loop;
  end Create;

end Root_Event.Simulation.Engine.Creator;

