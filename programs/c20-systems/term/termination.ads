with Ada.Task_Identification; with Ada.Task_Termination;
with Ada.Exceptions;
package Termination is

  protected Termination_Object is
    procedure Handle_Termination
     (Cause : in Ada.Task_Termination.Cause_Of_Termination;
      T     : in Ada.Task_Identification.Task_Id;
      X     : in Ada.Exceptions.Exception_Occurrence);
    entry Watchdog;
  private
    Unexpected_Termination: Boolean := False;
  end Termination_Object;

end Termination;
