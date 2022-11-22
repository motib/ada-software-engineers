with Ada.Text_IO;
procedure CallBA is
  type Buttons is (OK, Apply, Help, Cancel);
  package Buttons_IO is new Ada.Text_IO.Enumeration_IO(Buttons);

  type Clicks is (Left, Middle, Right);
  package Clicks_IO is new Ada.Text_IO.Enumeration_IO(Clicks);

  generic
    B: in Buttons;
  procedure Proc(C: in Clicks);
  procedure Proc(C: in Clicks) is
  begin
    Ada.Text_IO.Put("Clicked ");
    Clicks_IO.Put(C);
    Ada.Text_IO.Put(" on ");
    Buttons_IO.Put(B);
    Ada.Text_IO.New_Line;
  end Proc;

  procedure Proc_OK     is new Proc(OK);
  procedure Proc_Apply  is new Proc(Apply);
  procedure Proc_Help   is new Proc(Help);
  procedure Proc_Cancel is new Proc(Cancel);

  Callbacks: constant array(Buttons) of
      not null access procedure(C: in Clicks) := 
    (Proc_OK'Access,   Proc_Apply'Access,
     Proc_Help'Access, Proc_Cancel'Access);
begin
  loop
    declare
      B: Buttons;
      C: Clicks;
      use Ada.Text_IO;
    begin
      Put("Click mouse: ");
      Clicks_IO.Get(C);
      Put("on button:   ");
      Buttons_IO.Get(B);
      Skip_Line;
      Callbacks(B).all(C);
    exception
      when Data_Error => Put_Line("Invalid button pressed");
      when End_Error  => exit;
    end;
  end loop;
end CallBA;
