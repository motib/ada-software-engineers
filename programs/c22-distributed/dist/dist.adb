
with Root_Event;
with Simulation_Server;
with Root_Event.Telemetry; with Root_Event.Engine;
with Ada.Text_IO; use Ada.Text_IO;
procedure Dist is
  function Get_Event return Root_Event.Event_Ptr is
    C: Character;
  begin
    Put(" Choose system "); Get(C);
    if C = 'e' then
      return Root_Event.Engine.Create(500, 600);
    else
      return Root_Event.Telemetry.Create(
               Root_Event.Telemetry.Engines,
               Root_Event.Telemetry.Failed);
    end if;
  end Get_Event;
begin
  Simulation_Server.Go_Simulate(Get_Event);
end Dist;

