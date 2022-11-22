--
-- Instantiation of the simulator with tree queue
--
with Generic_Simulator;
with Event_Queue_1;
package Simulator_1 is new Generic_Simulator(Event_Queue_1);
