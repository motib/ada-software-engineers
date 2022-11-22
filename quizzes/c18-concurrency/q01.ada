with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
procedure Main is
  task T is
    entry E1(N: Integer);
    entry E2;
  end T;
  task body T is
  begin
    accept E1(N: Integer) do
      select
        when N > 0 => accept E2;
      end select;
    end E1;
  exception
    when Ex: others =>
      Put_Line("Task T " & Exception_Name(Ex));
  end T;

  task A;
  task body A is
  begin
    T.E1(0);
  exception
    when Ex: others =>
      Put_Line("Task A " & Exception_Name(Ex));
  end A;

begin
  T.E2;
exception
  when Ex: others =>
    Put_Line("Main " & Exception_Name(Ex));
end Main;

