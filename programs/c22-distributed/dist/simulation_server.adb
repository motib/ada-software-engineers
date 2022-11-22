
package body Simulation_Server is
  procedure Go_Simulate(E_Ptr: Root_Event.Event_Ptr) is
  begin
    Root_Event.Simulate(E_Ptr.all);
  end Go_Simulate;
end Simulation_Server;
