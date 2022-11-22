
with Event_Queue;
with Root_Event.Engine, Root_Event.Telemetry, Root_Event.Steering;
use Root_Event;
procedure RocketAD is
  Q: aliased Event_Queue.Queue;
begin
  for I in 1..15 loop
    Event_Queue.Put(Engine.Main_Engine_Event_Ptr'(Engine.Create), Q'Access);
    Event_Queue.Put(Engine.Aux_Engine_Event_Ptr'(Engine.Create), Q'Access);
    Event_Queue.Put(Telemetry.Create,   Q'Access);
    Event_Queue.Put(Steering.Create,    Q'Access);
  end loop;

  -- Get event from queue and dispatch to Simulate procedure.
  while not Event_Queue.Empty(Q'Access) loop
    Root_Event.Simulate(Event_Queue.Get(Q'Access).all);
  end loop;
end RocketAD;

