with Array_Priority_Queue; use Array_Priority_Queue;
with Ada.Text_IO; use Ada.Text_IO;
procedure Propagate1 is
  Q: Queue(10);
  I: Integer;

  procedure Get_And_Process is

    procedure Get_The_Data is
    begin
      Get(I, Q);
    end Get_The_Data;
    
    procedure Process is
    begin
      Get_The_Data;
    exception
      when Underflow => Put("Underflow handled in Process");
    end Process;
  
  begin -- Get_And_Process;
    Process;
  exception
    when Underflow => Put("Underflow handled in Get_And_Process");
  end Get_And_Process;

begin
  Get_And_Process;
end Propagate1;