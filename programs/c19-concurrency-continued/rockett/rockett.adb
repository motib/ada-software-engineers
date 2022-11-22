with Root_Event.Simulation;
with Rocket_Simulation;
procedure RocketT is
begin
  loop
    Root_Event.Simulate(
      Root_Event.Simulation.Get(Rocket_Simulation.R'Access));
  end loop;
end RocketT;
