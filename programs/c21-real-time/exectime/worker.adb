with Ada.Execution_Time;
package body Worker is
  procedure Is_Prime(I: in Positive) is
  begin
    for K in 2 .. I-1 loop
      exit when I mod K = 0;
    end loop;
  end Is_Prime;

  task body Worker_Task is
    Local: Natural;
    Start: Ada.Execution_Time.CPU_Time := Ada.Execution_Time.Clock;
    use type Ada.Execution_Time.CPU_Time;
  begin
    loop
      select
        accept Input(I: Positive) do
          Local := I;
        end Input;
        Is_Prime(Local);    -- Compute something
      or
        accept Stop(CPU: out Ada.Real_Time.Time_Span) do
          CPU := Ada.Execution_Time.Clock - Start;
        end Stop;
        exit;
      end select;
    end loop;
  end Worker_Task;
end Worker;
