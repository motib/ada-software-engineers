    
with Event_Queue;
with Root_Event.Engine, Root_Event.Telemetry, Root_Event.Steering;
use Root_Event;
procedure RocketQ is
  Q: aliased Event_Queue.Queue;  -- Aliased so Access can be taken
begin
  for I in 1..15 loop
    Event_Queue.Put(Engine.Main_Engine_Event'(Engine.Create), Q);
    Event_Queue.Put(Engine.Aux_Engine_Event'(Engine.Create), Q);
    Event_Queue.Put(Telemetry.Create,   Q);
    Event_Queue.Put(Steering.Create,    Q);
  end loop;

  -- Get event from queue and dispatch to Simulate procedure.
  while not Event_Queue.Empty(Q) loop
    Root_Event.Simulate(Event_Queue.Get(Q'Access));
  end loop;
end RocketQ;

