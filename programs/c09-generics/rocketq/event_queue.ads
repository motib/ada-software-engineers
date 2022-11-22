
with Root_Event; use Root_Event;
with Heterogeneous_Priority_Queue;
package Event_Queue is new 
  Heterogeneous_Priority_Queue(Root_Event.Event'Class);
