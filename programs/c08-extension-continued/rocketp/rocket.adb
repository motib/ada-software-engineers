with Event_Queue;
procedure Rocket is
  Q: Event_Queue.Queue_Ptr := new Event_Queue.Queue;
  procedure Create(Q: in Event_Queue.Queue_Ptr) is separate;
begin
  Create(Q);
  while not Event_Queue.Empty(Q.all) loop
    Event_Queue.Get(Q).Simulate;
  end loop;
end Rocket;

