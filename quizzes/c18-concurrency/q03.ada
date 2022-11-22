procedure Main is
  protected P is
    entry E1;
    entry E2;
  end P;
  procedure Proc renames P.E1;
  protected body P is
    entry E1 when True is
    begin
      null;
    end E1;
    entry E2 when True is
    begin
      Proc;
      requeue Proc;
    end E2;
  end P;
begin
  null;
end Main;

