package body Termination is
  protected body Termination_Object is

    procedure Handle_Termination
     (Cause : in Ada.Task_Termination.Cause_Of_Termination;
      T     : in Ada.Task_Identification.Task_Id;
      X     : in Ada.Exceptions.Exception_Occurrence) is
      use Ada.Task_Termination;
    begin
      Unexpected_Termination := Cause /= Normal;
    end Handle_Termination;
    
    entry Watchdog when Unexpected_Termination is
    begin
      null;
    end Watchdog;

  end Termination_Object;
end Termination;
