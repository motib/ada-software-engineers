with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;
with Ada.Synchronous_Task_Control;
procedure Main is
  SO: Ada.Synchronous_Task_Control.Suspension_Object;

  task type T;
  task body T is
  begin
    Ada.Synchronous_Task_Control.Suspend_Until_True(SO);
  exception
    when E: others => Put_Line(Ada.Exceptions.Exception_Name(E));
  end T;
  
  A: array(0..1) of T;
begin
  null;
end Main;
