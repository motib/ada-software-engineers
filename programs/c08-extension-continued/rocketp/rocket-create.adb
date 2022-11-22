with Root_Event.Engine, Root_Event.Telemetry, Root_Event.Steering;
use Root_Event;
separate(Rocket)
procedure Create(Q: in Event_Queue.Queue_Ptr) is
  procedure Create_Event(E: in Event'Class) is
    Ev: Event'Class := E;
  begin
    Ev.Start;
    Event_Queue.Put(Ev, Q.all);
  end Create_Event;
begin
  for I in 1..15 loop
    Create_Event(Engine.Main_Engine_Event'(Engine.Create));
    Create_Event(Engine.Aux_Engine_Event'(Engine.Create));
    Create_Event(Telemetry.Create);
    Create_Event(Steering.Create);
  end loop;
end Create;

