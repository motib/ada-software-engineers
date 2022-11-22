with Array_Priority_Queue; use Array_Priority_Queue;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
procedure Info is
  Q: Queue(10);
  I: Integer;
  Queue_Error: exception;

  procedure Get_The_Data is
  begin
    Get(I, Q);
  exception
    when E: Overflow | Underflow => 
      Put(Exception_Information(E));
      raise Queue_Error;
  end Get_The_Data;
    
begin
  Get_The_Data;
exception
  when E: Queue_Error => 
    Put(Exception_Information(E));
end Info;
