with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type T is limited interface;
  protected type P is new T with
    procedure Proc;
  end P;
  protected body P is
    procedure Proc is
    begin
      null;
    end Proc;
  end P;
begin
  Put_Line(P'External_Tag);
end Main;
