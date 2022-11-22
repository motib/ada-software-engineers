package Periodic is
  type Data_Type is array(0..1) of Natural;

  protected Protected_Data is
    procedure Write(D: in  Data_Type);
    entry     Read (D: out Data_Type);
  private
    Data:       Data_Type := (others => 0);
    Data_Ready: Boolean := False;
  end Protected_Data;

  task Periodic_Task;
end Periodic;
