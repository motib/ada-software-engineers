
with Event_Queue;
with Root_Event.Engine, Root_Event.Telemetry, Root_Event.Steering;
use Root_Event;
procedure RocketF is
  Q: Event_Queue.Queue_Ptr := new Event_Queue.Queue;
begin
  for I in 1..15 loop
    Event_Queue.Put(Engine.Main_Engine_Event'(Engine.Create), Q.all);
    Event_Queue.Put(Engine.Aux_Engine_Event'(Engine.Create), Q.all);
    Event_Queue.Put(Telemetry.Create,   Q.all);
    Event_Queue.Put(Steering.Create,    Q.all);
  end loop;

  -- Get event from queue and dispatch to Simulate procedure.
  loop
    declare
      First:  Event'Class := Event_Queue.Get(Q);
      Second: Event'Class := Another(First, Root_Event.Create);
    begin
      Event_Queue.Put(Second, Q.all);
      Root_Event.Simulate(First);
    end;
  end loop;
end RocketF;

