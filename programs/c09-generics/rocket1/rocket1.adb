with Simulator_1; with Simulator_2;
with Root_Event.Rocket_Event.Engine;
with Root_Event.Rocket_Event.Telemetry;
with Root_Event.Rocket_Event.Steering;
procedure Rocket1 is
  use Root_Event.Rocket_Event;
begin
  for I in 1..15 loop
    Simulator_1.Add_Event(Engine.Main_Engine_Event'(Engine.Create));
    Simulator_1.Add_Event(Engine.Aux_Engine_Event'(Engine.Create));
    Simulator_1.Add_Event(Telemetry.Create);
    Simulator_1.Add_Event(Steering.Create);
  end loop;
  for I in 1..15 loop
    Simulator_2.Add_Event(Engine.Main_Engine_Event'(Engine.Create));
    Simulator_2.Add_Event(Engine.Aux_Engine_Event'(Engine.Create));
    Simulator_2.Add_Event(Telemetry.Create);
    Simulator_2.Add_Event(Steering.Create);
  end loop;

  Simulator_1.Run;
  Simulator_2.Run;
end Rocket1;

