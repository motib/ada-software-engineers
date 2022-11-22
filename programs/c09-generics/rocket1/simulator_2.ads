--
-- Instantiation of the simulator with array queue
--
with Generic_Simulator;
with Event_Queue_2;
package Simulator_2 is new Generic_Simulator(Event_Queue_2);
