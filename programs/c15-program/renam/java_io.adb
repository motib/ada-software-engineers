with Ada.Text_IO;
package body Java_IO is
  procedure print(S: in String)   renames Ada.Text_IO.Put;
  procedure println(S: in String) renames Ada.Text_IO.Put_Line;
  procedure println is
  begin
    Ada.Text_IO.New_Line;
  end println;
end Java_IO;
