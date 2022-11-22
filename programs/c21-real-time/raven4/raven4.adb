with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Periodic;
procedure Raven4 is
  Interval: constant Time_Span := Milliseconds(400);
  Next:     Time := Clock + Interval;
  Data:     Periodic.Data_Type;
begin
  loop
    delay until Next;
    Periodic.Protected_Data.Read(Data);
    Ada.Text_IO.Put(
      Integer'Image(Data(0)) & '-' & Integer'Image(Data(1)));
    Next := Next + Interval;
  end loop;
end Raven4;
