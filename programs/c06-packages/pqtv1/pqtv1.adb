with Priority_Queue;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure PQTV1 is

  I: Integer;                   -- Element of the queue
  Test_Data: array(Positive range <>) of Integer :=
    (10, 5, 0, 25, 15, 30, 15, 20, -6, 40);

begin
  for N in Test_Data'Range loop
    Put(Test_Data(N), Width => 5);
    Priority_Queue.Put(Test_Data(N));
  end loop;
  New_Line;

  while not Priority_Queue.Empty loop
    Priority_Queue.Get(I);
    Put(I, Width => 5);
  end loop;
  New_Line;

  Priority_Queue.Get(I);  -- Test underflow

exception
  when Priority_Queue.Underflow => Put_Line("Underflow from queue");
  when Priority_Queue.Overflow  => Put_Line("Overflow  from queue");
end PQTV1;
