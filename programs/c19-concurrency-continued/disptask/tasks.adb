
with Ada.Text_IO; 
package body Tasks is
  task body Worker_1 is
  begin
    accept Input do
      Ada.Text_IO.Put_Line("Worker 1");
    end Input;
  end Worker_1;

  task body Worker_2 is
  begin
    accept Input do
      Ada.Text_IO.Put_Line("Worker 2");
    end Input;
  end Worker_2;
end Tasks;
