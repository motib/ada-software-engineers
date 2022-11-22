with Rocket_Event;
with Rocket_Tree_Queue; use Rocket_Tree_Queue;
with Generic_Event_Priority_Queue;
package Rocket_Event_Queue is 
  new Generic_Event_Priority_Queue(Rocket_Event.Event, Queue);
