with Rocket_Root_Event;
with Rocket_Event_Queue;
with Generic_Simulator;
package Rocket_Simulator is 
  new Generic_Simulator(Rocket_Root_Event, Rocket_Event_Queue);
