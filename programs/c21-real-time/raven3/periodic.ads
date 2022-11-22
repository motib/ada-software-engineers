with Ada.Synchronous_Task_Control;
package Periodic is
  Data: Natural := 0;
  pragma Atomic(Data);
  S: Ada.Synchronous_Task_Control.Suspension_Object;
  task Periodic_Task;
end Periodic;
