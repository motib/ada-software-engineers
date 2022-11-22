with Generic_Root_Event;
with Generic_Event_Priority_Queue;
generic
  with package Root_Event  is 
    new Generic_Root_Event(<>);
  with package Event_Queue is 
    new Generic_Event_Priority_Queue(Event => Root_Event.Event, others => <>);
package Generic_Simulator is
  procedure Add_Event(E: in Root_Event.Event'Class);
  procedure Run;
end Generic_Simulator;
