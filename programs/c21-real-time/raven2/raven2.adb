with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Periodic;
procedure Raven2 is
  Interval: constant Time_Span := Milliseconds(400);
  Next:     Time := Clock + Interval;
begin
  loop
    delay until Next;
    Ada.Text_IO.Put(Integer'Image(Periodic.Data));
    Next := Next + Interval;
  end loop;
end Raven2;
