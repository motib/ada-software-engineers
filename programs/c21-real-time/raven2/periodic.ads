package Periodic is
  Data: Natural := 0;
  pragma Atomic(Data);
  task Periodic_Task;
end Periodic;
