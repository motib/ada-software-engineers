with Priority_Queue; 
with Ada.Text_IO; use Ada.Text_IO;
procedure PQTCT is
  Q: Priority_Queue.Queue(10);
  Test_Data: array(Positive range <>) of Integer :=  (10, 5, 25, 15);
begin
  for I in Test_Data'Range loop
    Put_Line("Put       " & Integer'Image(Test_Data(I)));
    Priority_Queue.Put(Priority_Queue.Create(Test_Data(I)), Q);
  end loop;

  declare 
    N: Priority_Queue.Node;
  begin
    while not Priority_Queue.Empty(Q) loop
      Priority_Queue.Get(N, Q);
      Put_Line("Get       " & Integer'Image(Priority_Queue.Value(N)));
    end loop;
  end;
end PQTCT;
