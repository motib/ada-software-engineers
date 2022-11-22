with Ada.Text_IO; use Ada.Text_IO;
with Ada.Task_Identification;
with Ada.Task_Termination;
with Buffer, Termination;
package body Producer is
  task body Producer_Task is
    subtype Value_Range is Integer range 1..20;
    N: Value_Range := 1;
  begin
    Ada.Task_Termination.Set_Specific_Handler(
      Ada.Task_Identification.Current_Task,
      Termination.Termination_Object.Handle_Termination'Access);
    loop
      Put_Line("Producing " & Integer'Image(N));
      Buffer.Buffer_Object.Append(N);
      N := N + 1;
    end loop;
  -- exception
  --   when Constraint_Error => Put_Line("Handling exception");
  end Producer_Task;
end Producer;
