with Array_Priority_Queue; use Array_Priority_Queue;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
procedure Reraise is
  Q: Queue(10);
  I: Integer;
  Queue_Error: exception;

  procedure Get_The_Data0 is
  begin
    Get(I, Q);
  exception
    when E: Underflow => 
      Put_Line("Underflow from 0 at " & Exception_Message(E));
  end Get_The_Data0;
    
  procedure Get_The_Data1 is
  begin
    Get(I, Q);
  exception
    when E: Underflow =>
      Put_Line("Underflow from 1 at " & Exception_Message(E));
      raise;
  end Get_The_Data1;
    
  procedure Get_The_Data2 is
  begin
    Get(I, Q);
  exception
    when E: Underflow => 
      Put_Line("Underflow from 2 at " & Exception_Message(E));
      raise Queue_Error with Time_Stamp;
  end Get_The_Data2;
begin
  begin
    Get_The_Data0;
  exception
    when E: Underflow   => 
      Put_Line("Underflow from main at " & Exception_Message(E));
  end;
  Put_Line("---------");
  begin
    Get_The_Data1;
  exception
    when E: Underflow   => 
      Put_Line("Underflow from main at " & Exception_Message(E));
  end;
  Put_Line("---------");
  begin
    Get_The_Data2;
  exception
    when E: Queue_Error => 
      Put_Line("Queue_Error from main at " & Exception_Message(E));
  end;
end Reraise;
