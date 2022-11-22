with Ada.Real_Time;
package Worker is
  task type Worker_Task is
    entry Input(I: Positive);
    entry Stop(CPU: out Ada.Real_Time.Time_Span);
  end Worker_Task;
end Worker;
