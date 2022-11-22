with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
  type Int_Ptr is access all Integer;
  N: aliased Integer;
  function Func return Int_Ptr is
  begin
    return N'Access;
  end Func;
begin
  Func.all := 5;
  Put(N);
end Main;

