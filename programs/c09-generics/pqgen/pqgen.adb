with Priority_Queue; 
with Ada.Text_IO; with Ada.Integer_Text_IO; with Ada.Float_Text_IO; 
use Ada; use Ada.Text_IO;
procedure PQGEN is

  package Integer_Queue is new Priority_Queue(Item => Integer);
  package Float_Queue is new Priority_Queue(Item => Float);

  QI: Integer_Queue.Queue(10);  -- Create queue of size 10
  QF: Float_Queue.Queue(10);    -- Create queue of size 10
  I: Integer;                   -- Element of the queue
  F: Float;                     -- Element of the queue
  Integer_Test_Data: array(Positive range <>) of Integer :=  
    (10, 5, 0, 25, 15, 30, 15, 20, -6, 40);
  Float_Test_Data: array(Positive range <>) of Float :=  
    (10.0, 5.0, 0.0, 25.0, 15.0, 30.0, 15.0, 20.0, -6.0, 40.0);

  procedure Put(F: in Float; 
    Fore: in Field:=3; Aft: in Field:=1; Exp: in Field:=0)
      renames Float_Text_IO.Put;

begin
  for N in Integer_Test_Data'Range loop
    Integer_Text_IO.Put(Integer_Test_Data(N), Width => 5); 
    Integer_Queue.Put(Integer_Test_Data(N), QI);
  end loop;
  New_Line;

  for N in Float_Test_Data'Range loop
    Put(Float_Test_Data(N));
    Float_Queue.Put(Float_Test_Data(N), QF);
  end loop;
  New_Line;

  while not Integer_Queue.Empty(QI) loop
    Integer_Queue.Get(I, QI);
    Integer_Text_IO.Put(I, Width => 5); 
  end loop;
  New_Line;

  while not Float_Queue.Empty(QF) loop
    Float_Queue.Get(F, QF);
    Put(F);
  end loop;
  New_Line;

exception
  when Integer_Queue.Underflow | Float_Queue.Underflow => 
    Put_Line("Underflow from queue");
  when Integer_Queue.Overflow | Float_Queue.Overflow   => 
    Put_Line("Overflow  from queue");
end PQGEN;

