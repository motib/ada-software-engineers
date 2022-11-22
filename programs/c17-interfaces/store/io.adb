with Ada.Text_IO, Ada.Float_Text_IO;
package body IO is
  procedure Put(Item: in Float) is
  begin
    Ada.Float_Text_IO.Put(Item, Fore => 3, Aft => 1, Exp => 0);
  end Put;

  procedure Put(Item: in Boolean) is
  begin
    Ada.Text_IO.Put_Line("  " & Boolean'Image(Item));
  end Put;

  procedure Put(Item: in String) renames Ada.Text_IO.Put_Line;
end IO;