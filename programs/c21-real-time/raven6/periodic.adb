with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
package body Periodic is
  protected body Protected_Data is
    entry Write(D: in Natural; ID: in Natural)
      -- Not Ravenscar, not simple barrier
      -- Not Ravenscar, too many tasks queued on the entry
      when not Data_Ready is
    begin
      Data(ID) := D;
      Updates := Updates + 1;
      if Updates = Data_Type'Length then
        Data_Ready := True;
        Updates := 0;
      end if;
    end Write;

    entry Read (D: out Data_Type) when Data_Ready is
    begin
      D := Data;
      Data_Ready := False;
    end Read;
  end Protected_Data;

  task body Periodic_Task is
    Interval: constant Time_Span := Milliseconds(200);
    Next:     Time := Clock + Interval;
    D:        Natural := 0;
  begin
    loop
      delay until Next;
      D := (D + 1) mod 10;
      Protected_Data.Write(D, ID);
      Next := Next + Interval;
    end loop;
  end Periodic_Task;
end Periodic;
