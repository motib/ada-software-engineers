with Array_Priority_Queue; use Array_Priority_Queue;
with Ada.Text_IO; use Ada.Text_IO;
procedure Propagate2 is
  Q: aliased Queue(10);
  
  function Get(Q: access Queue) return Integer is
    I: Integer;
  begin
    Get(I, Q.all);
    return I;
  end Get;

  procedure Get_And_Process is

    procedure Process is
      I: Integer := Get(Q'Access);
    begin
      Put_Line(Integer'Image(I));
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
end Propagate2;