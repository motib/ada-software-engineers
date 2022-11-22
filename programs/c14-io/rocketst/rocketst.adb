with Event_Queue;
with Root_Event.Engine, Root_Event.Telemetry, Root_Event.Steering;
use Root_Event;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
procedure RocketST is
  Q: Event_Queue.Queue_Ptr := new Event_Queue.Queue;
  Event_File: File_Type;
  S: Stream_Access;
begin
  Create(Event_File, Name=>"Event.Str");
  S := Stream(Event_File);

  for I in 1..15 loop
    Event'Class'Output(S, 
      Event'Class(Engine.Main_Engine_Event'(Engine.Create)));
    Event'Class'Output(S, 
      Event'Class(Engine.Aux_Engine_Event'(Engine.Create)));
    Event'Class'Output(S, Event'Class(Telemetry.Create));
    Event'Class'Output(S, Event'Class(Steering.Create));
  end loop;
  Close(Event_File);

  Open(Event_File, In_File, Name=>"Event.Str");
  S := Stream(Event_File);
  for I in 1..45 loop
    Event_Queue.Put(Event'Class'Input(S), Q.all);
  end loop;
  Close(Event_File);

  while not Event_Queue.Empty(Q.all) loop
    Root_Event.Simulate(Event_Queue.Get(Q));
  end loop;
end RocketST;
