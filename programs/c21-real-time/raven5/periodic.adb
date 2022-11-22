with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
package body Periodic is
  protected body Protected_Data is
    procedure Write(D: in  Data_Type) is
    begin
      Data := D;
      Data_Ready := True;
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
    Data:     Data_Type := (others => 0);
  begin
    loop
      delay until Next;
      Data(0) := (Data(0) + 1) mod 10;
      Data(1) := (Data(1) + 1) mod 10;
      Protected_Data.Write(Data);
      Next := Next + Interval;
    end loop;
  end Periodic_Task;
end Periodic;
