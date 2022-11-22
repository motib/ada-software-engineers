with Ada.Text_IO;
procedure Main is
  type Money is delta 0.01 digits 12;
  type Rates is delta 0.00000001 digits 11;
  Conversion: constant array(1..2, 1..2) of Rates :=
    ((1.0, 0.5059), (1.9767, 1.0));

  Special: constant Rates := 1.1;
  Extra: Boolean := True;

  function "*"(Left, Right: Rates) return Rates is
  begin
    if Extra then
      return Standard."*"(Left, Right+0.01);
    else 
      return Standard."*"(Left, Right);
    end if;
  end "*";

  Amount: Money := 100.0;
  M: Money;
begin
  M := Money(Conversion(1, 2) * (Special * Amount));
  Ada.Text_IO.Put_Line(Money'Image(M));
end Main;
