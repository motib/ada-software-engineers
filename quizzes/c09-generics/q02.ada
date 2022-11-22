package P is
  Local_Max: Integer := 100;
  generic
    Max: Integer := Local_Max;
  package GP is
    procedure Proc;
  end GP;
end P;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body P is
  package body GP is
    procedure Proc is
    begin
      Put(Max);
    end Proc;
  end GP;
end P;

with P;
procedure Main is
  package First_GP is new P.GP;
  function Init return Integer is
  begin
    P.Local_Max := 200;
    return 1;
  end Init;
  N: Integer := Init;
  package Second_GP is new P.GP;
begin
  First_GP.Proc;
  Second_GP.Proc;
end Main;

