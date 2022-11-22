with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
procedure Main is

  protected PO is
    entry E;
  private
    C: Character := Character'First;
  end PO;

  protected body PO is
    entry E when Character'Pred(C) < 'A' is
    begin
      null;
    end E;
  end PO;

begin
  PO.E;
exception
  when Ex: others =>
    Put_Line("Main " & Exception_Name(Ex));
end Main;

