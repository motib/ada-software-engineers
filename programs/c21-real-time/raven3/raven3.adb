with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control;
with Periodic;
procedure Raven3 is
  Interval: constant Time_Span := Milliseconds(400);
  Next:     Time := Clock + Interval;
begin
  loop
    delay until Next;
    Ada.Text_IO.Put(Integer'Image(Periodic.Data));
    Ada.Synchronous_Task_Control.Set_True(Periodic.S);
    Next := Next + Interval;
  end loop;
end Raven3;
