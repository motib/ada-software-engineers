with Event_Queue;
with Root_Event.Engine, Root_Event.Telemetry, Root_Event.Steering;
use Root_Event;
procedure RocketCon is
  Q: Event_Queue.Set;
  Position: Event_Queue.Cursor;
begin
  for I in 1..15 loop
      Event_Queue.Insert(Q, Engine.Main_Engine_Event'(Engine.Create));
      Event_Queue.Insert(Q, Engine.Aux_Engine_Event'(Engine.Create));
      Event_Queue.Insert(Q, Telemetry.Create);
      Event_Queue.Insert(Q, Steering.Create);
  end loop;

  -- Get event from queue and dispatch to Simulate procedure.
  while not Event_Queue.Is_Empty(Q) loop
    Position := Event_Queue.First(Q);
    Root_Event.Simulate(Event_Queue.Element(Position));
    Event_Queue.Delete(Q, Position);
  end loop;
end RocketCon;

