
with Ada.Text_IO; 
package body Tasks is
  task body Main_Task is
  begin
    Left.Input;
    Right.Input;
  end Main_Task;

  task body Worker_Task is
  begin
    accept Input do
      Ada.Text_IO.Put_Line(ID & " called");
    end Input;
  end Worker_Task;
end Tasks;
