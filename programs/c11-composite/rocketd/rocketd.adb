
with Event_Queue;
with Event_Package; use Event_Package;
procedure RocketD is
  Q: Event_Queue.Queue_Ptr := new Event_Queue.Queue;
begin
  for I in 1..15 loop
    Event_Queue.Put(Main_Engine_Event'(Create(I mod 4 + 1)), Q.all);
    Event_Queue.Put(Aux_Engine_Event'(Create(I mod 4 + 1)),  Q.all);
    Event_Queue.Put(Telemetry_Event'(Create(I mod 4 + 1)),   Q.all);
    Event_Queue.Put(Steering_Event'(Create(I mod 4 + 1)),    Q.all);
  end loop;

  -- Get event from queue and dispatch to Simulate procedure.
  while not Event_Queue.Empty(Q.all) loop
    Event_Package.Simulate(Event_Queue.Get(Q));
  end loop;
end RocketD;

