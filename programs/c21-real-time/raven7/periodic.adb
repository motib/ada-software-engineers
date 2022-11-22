with Ada.Real_Time; use Ada.Real_Time;
package body Periodic is
  protected body Protected_Data is
    procedure Write(D: in Natural; ID: in Natural) is
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
      for I in SO_Type'Range loop
        Ada.Synchronous_Task_Control.Set_True(S(I));
      end loop;
    end Read;
  end Protected_Data;

  task body Periodic_Task is
    Interval: constant Time_Span := Milliseconds(200);
    Next:     Time := Clock + Interval;
    D:        Natural := 0;
  begin
    Ada.Synchronous_Task_Control.Set_True(S(ID));
    loop
      Ada.Synchronous_Task_Control.Suspend_Until_True(S(ID));
      delay until Next;
      D := (D + 1) mod 10;
      Protected_Data.Write(D, ID);
      Next := Next + Interval;
    end loop;
  end Periodic_Task;
end Periodic;
