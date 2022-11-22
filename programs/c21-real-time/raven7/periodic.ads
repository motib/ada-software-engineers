with Ada.Synchronous_Task_Control;
package Periodic is
  type Data_Type is array(0..1) of Natural;
  type SO_Type   is 
         array(Data_Type'Range) of Ada.Synchronous_Task_Control.Suspension_Object;
  S: SO_Type;

  protected Protected_Data is
    procedure Write(D: in  Natural; ID: in Natural);
    entry     Read (D: out Data_Type);
  private
    Data:       Data_Type := (others => 0);
    Data_Ready: Boolean := False;
    Updates:    Natural := 0;
  end Protected_Data;

  task type Periodic_Task(ID: Natural);
  T0: Periodic_Task(0);
  T1: Periodic_Task(1);
end Periodic;
