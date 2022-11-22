with Root_Event.Simulation.Telemetry.Creator;
with Root_Event.Simulation.Engine.Creator;
with Root_Event.Simulation.Steering.Creator;
package body Rocket_Simulation is
  use Root_Event.Simulation;
  T:  Telemetry.Creator.Create(R'Access);
  E:  Engine.Creator.Create(R'Access);
  S:  Steering.Creator.Create(R'Access);
begin
  null;
end Rocket_Simulation;
