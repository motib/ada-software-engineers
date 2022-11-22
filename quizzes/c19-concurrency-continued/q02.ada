with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

  task type T(ID: Integer);
  type Ptr is access T;

  task body T is
  begin
    for I in 1 .. 5 loop
      Put_Line("Hi from task " & Integer'Image(ID));
      delay 0.5*ID;
    end loop;
  end T;

begin
  Put_Line("Main subprogram");
  declare
    P: Ptr := new T(1);
--    type New_Ptr is access T;
--    New_P: New_Ptr := new T(2);
  begin
    null;
  end;
  Put_Line("Back from block");
end Main;

