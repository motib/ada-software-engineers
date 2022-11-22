with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

  task T1 is
    entry E;
  end T1;

  task body T1 is
  begin
    delay 0.2;
    accept E do
      Put_Line("Starting T1.E");
      delay 0.8;
      Put_Line("Finishing T1.E");
    end E;
  end T1;

  task T2 is
    entry E;
  end T2;

  task body T2 is
  begin
    delay 0.4;
    accept E do
      Put_Line("Starting T2.E");
      delay 0.1;
      Put_Line("Finishing T2.E");
    end E;
  end T2;

begin
  select
    T1.E;
    Put_Line("Finished triggering");
  then abort
    T2.E;
    Put_Line("Finished abortable");
  end select;
end Main;

