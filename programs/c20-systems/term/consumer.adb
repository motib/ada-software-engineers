with Buffer;
with Ada.Text_IO; use Ada.Text_IO;
package body Consumer is
  task body Consumer_Task is
    N: Integer;
  begin
    loop
      Buffer.Buffer_Object.Take(N);
      Put_Line(Integer'Image(ID) & " consuming " & Integer'Image(N));
    end loop;
  end Consumer_Task;
end Consumer;
