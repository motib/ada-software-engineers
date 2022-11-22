--
--  Instantiate random number generator for all events
--  Private package so it can instantiate with private Simulation_Time
--
with Ada.Numerics.Discrete_Random;
private package Root_Event.Rocket_Event.Random_Time is
  new Ada.Numerics.Discrete_Random(Simulation_Time);
