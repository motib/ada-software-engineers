package body Generic_Simulator is
  Q: aliased Event_Queue.Queue(100);
  procedure Add_Event(E: in Root_Event.Event'Class) is
  begin
    Event_Queue.Put(E, Q'Access);
  end Add_Event;
  procedure Run is
  begin
    while not Event_Queue.Empty(Q'Access) loop
      Root_Event.Simulate(Event_Queue.Get(Q'Access));
    end loop;
  end Run;
end Generic_Simulator;
