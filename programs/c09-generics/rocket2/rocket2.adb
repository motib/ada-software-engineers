with Rocket_Simulator;
with Rocket_Event;
procedure Rocket2 is
  use Rocket_Event;
begin
  for I in 1..15 loop
    Rocket_Simulator.Add_Event(Main_Engine_Event'(Create));
    Rocket_Simulator.Add_Event(Aux_Engine_Event'(Create));
    Rocket_Simulator.Add_Event(Telemetry_Event'(Create));
    Rocket_Simulator.Add_Event(Steering_Event'(Create));
  end loop;
  Rocket_Simulator.Run;
end Rocket2;
