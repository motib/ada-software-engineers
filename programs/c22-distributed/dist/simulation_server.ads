
with Root_Event;
package Simulation_Server is
  pragma Remote_Call_Interface;
  procedure Go_Simulate(E_Ptr: Root_Event.Event_Ptr);
end Simulation_Server;
