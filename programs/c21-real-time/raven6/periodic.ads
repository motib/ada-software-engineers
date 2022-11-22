package Periodic is
  type Data_Type is array(0..1) of Natural;

  protected Protected_Data is
    -- Not Ravenscar, too many entries
    entry Write(D: in  Natural; ID: in Natural);
    entry Read (D: out Data_Type);
  private
    Data:       Data_Type := (others => 0);
    Data_Ready: Boolean := False;
    Updates:    Natural := 0;
  end Protected_Data;

  task type Periodic_Task(ID: Natural);
  T0: Periodic_Task(0);
  T1: Periodic_Task(1);
end Periodic;
