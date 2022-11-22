with Worker;
with Ada.Text_IO, Ada.Numerics.Discrete_Random, Ada.Real_Time;
procedure ExecTime is
  -- Group of worker tasks
  subtype Group is Natural range 0..9;
  W: array(Group) of Worker.Worker_Task;

  -- Random number generator
  package Random_Numbers is new Ada.Numerics.Discrete_Random(Group);
  G: Random_Numbers.Generator;

  package Duration_IO is new Ada.Text_IO.Fixed_IO(Duration);

  CPU:       Ada.Real_Time.Time_Span;
  Total_CPU: Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
  use type   Ada.Real_Time.Time_Span;
begin
  -- Randomly divide processing among workers
  for I in 1 .. 100_000 loop
    W(Random_Numbers.Random(G)).Input(I);
  end loop;

  for I in Group loop
    -- Get CPU time for each worker, add to total and print it
    W(I).Stop(CPU);
    Total_CPU := Total_CPU + CPU;
    Ada.Text_IO.Put("Task" & Integer'Image(I) & " time="); 
    Duration_IO.Put(Ada.Real_Time.To_Duration(CPU), Fore => 2, Aft => 5);
    Ada.Text_IO.New_Line;
  end loop;
  -- Print total CPU time
  Ada.Text_IO.Put("Total  time="); 
  Duration_IO.Put(Ada.Real_Time.To_Duration(Total_CPU), Fore => 2, Aft => 5);
  Ada.Text_IO.New_Line;
end ExecTime;
