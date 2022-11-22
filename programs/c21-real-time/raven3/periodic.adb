with Ada.Real_Time; use Ada.Real_Time;
package body Periodic is
  task body Periodic_Task is
    Interval: constant Time_Span := Milliseconds(200);
    Next:     Time := Clock + Interval;
  begin
    loop
      Ada.Synchronous_Task_Control.Suspend_Until_True(S);
      delay until Next;
      Data := (Data + 1) mod 10;
      Next := Next + Interval;
    end loop;
  end Periodic_Task;
end Periodic;
