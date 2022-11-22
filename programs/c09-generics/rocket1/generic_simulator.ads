with Root_Event;
with Generic_Event_Priority_Queue;
generic
  with package Event_Queue is new Generic_Event_Priority_Queue(<>);
package Generic_Simulator is
  procedure Add_Event(E: in Root_Event.Event'Class);
  procedure Run;
end Generic_Simulator;
