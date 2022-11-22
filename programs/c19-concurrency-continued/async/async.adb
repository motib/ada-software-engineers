with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
procedure Async is
  task User is
    entry Trigger;
  end User;
  task body User is
  begin
    declare
      S: String := Get_Line;
    begin
      null;
    end;
    accept Trigger;
    Put_Line("User trigger");
  end User;

  Period: constant Duration := 0.2;
  Next: Time := Clock + Period;
begin
  select
    User.Trigger;
  then abort
    for I in 1 .. 50 loop
      delay until Next;
      Put('*');
      Next := Next + Period;
    end loop;
  end select;
end Async;
