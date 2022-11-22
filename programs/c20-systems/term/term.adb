with Consumer, Producer, Termination;
with Ada.Text_IO;
procedure Term is
  C1: Consumer.Consumer_Task(1);
  C2: Consumer.Consumer_Task(2);
  P:  Producer.Producer_Task;
begin
  Termination.Termination_Object.Watchdog;
  abort P, C1, C2;
end Term;
