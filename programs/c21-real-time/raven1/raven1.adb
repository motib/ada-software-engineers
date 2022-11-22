with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
procedure Raven1 is
  Interval: constant Time_Span := Milliseconds(200);
  Next:     Time := Clock + Interval;
begin
  loop
    delay until Next;
    Ada.Text_IO.Put('*');
    Next := Next + Interval;
  end loop;
end Raven1;
