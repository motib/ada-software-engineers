--
-- Periodic task.
--
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
procedure Period is
  Start, Stop: Time;

  task Periodic;
  task body Periodic is
    Interval: constant Duration := 0.2;
    Next: Time := Clock + Interval;
  begin
    Start := Clock;
    for N in 1..50 loop
      delay until Next;  -- Not delay Next - Clock !!
      Put('*');
      Next := Next + Interval;
    end loop;
    Stop := Clock;
  end Periodic;

begin
  loop
    exit when Periodic'Terminated;
    delay 0.01;
  end loop;
  New_Line;
  Put_Line("Elapsed time = " & Duration'Image(Stop-Start));
end Period;

