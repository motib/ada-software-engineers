with Event_Queue;
with Root_Event.Engine, Root_Event.Telemetry, Root_Event.Steering;
use Root_Event;
with Ada.Tags.Generic_Dispatching_Constructor;
with Ada.Text_IO;
procedure RocketFAC is
  Q: Event_Queue.Queue_Ptr := new Event_Queue.Queue;
  function Constructor is
    new Ada.Tags.Generic_Dispatching_Constructor(
      Event, Parameters, Create);
  T: array(Natural range <>) of Ada.Tags.Tag :=
       (Engine.Main_Engine_Event'Tag,
        Engine.Aux_Engine_Event'Tag,
        Telemetry.Telemetry_Event'Tag,
        Steering.Steering_Event'Tag);
  Dummy: aliased Parameters := (null record);
begin
  for I in 1..5 loop
    Ada.Text_IO.Put("Click on event: ");
    Event_Queue.Put(
      Constructor(
        T(Integer'Value(Ada.Text_IO.Get_Line)),
        Dummy'Access),
      Q.all);
  end loop;

  while not Event_Queue.Empty(Q.all) loop
    Root_Event.Simulate(Event_Queue.Get(Q));
  end loop;
end RocketFAC;
