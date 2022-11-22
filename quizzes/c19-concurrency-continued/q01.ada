with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

  task type T(ID: Integer);
  task body T is
    N: Positive := ID;
  begin
    for I in 1 .. 4 loop
      Put_Line("Hi from task " & Integer'Image(ID));
    end loop;
  end T;

  T0: T(0);
  T1: T(1);

begin
  null;
exception
  when Tasking_Error => Put_Line("A task has died");
end Main;

