with Ada.Text_IO;
package P is
  procedure Proc(N: Ada.Text_IO.Count);
end P;

use Ada.Text_IO;
package body P is
  procedure Proc(N: Ada.Text_IO.Count) is
  begin
    for I in 1..N loop
      Put_Line("*");
    end loop;
  end Proc;
end P;
