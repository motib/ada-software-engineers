with Ada.Strings.Bounded;
with Ada.Characters.Latin_1; 
with Ada.Text_IO.Editing; 
use Ada.Text_IO;
procedure Convert2 is

  type Currencies is (USD, GBP, EUR, JPY, CHF, INR, CNY);
  package Currency_IO is new Enumeration_IO(Currencies);

  package Sign_Strings is 
    new Ada.Strings.Bounded.Generic_Bounded_Length(10);
  use Sign_Strings;
  Signs: constant array(Currencies) of Bounded_String := (
    To_Bounded_String((1=>Ada.Characters.Latin_1.Dollar_Sign)),
    To_Bounded_String((1=>Ada.Characters.Latin_1.Pound_Sign)), 
    To_Bounded_String("Euro"), 
    To_Bounded_String((1=>Ada.Characters.Latin_1.Yen_Sign)), 
    To_Bounded_String("SF"), 
    To_Bounded_String("Rupee"), 
    To_Bounded_String("Yuan"));

  type Money is delta 0.01 digits 12;
  package Money_IO is new Decimal_IO(Money);

  type Rates is delta 0.00000001 digits 11;
  Conversion: constant array(Currencies, Currencies) of Rates :=
  ((   1.0, 0.5059, 0.6775,  108.645, 1.1126,  5.4004,  7.2735),
   (1.9767,    1.0, 1.3392, 214.4697, 2.1993, 77.6415, 14.3775),
   (1.4760, 0.7467,    1.0, 160.2895, 1.6423, 58.0039, 10.7358),
   (0.0092043,  0.00466267,  0.0062387,
          1.0,   0.0101983,   0.361912, 0.066988),
   (0.8989, 0.4547, 0.6087,  98.0551,    1.0, 35.3045,  6.5374),
   (0.0255, 0.0129, 0.0172,   2.7631, 0.0283,     1.0,  0.1852),
   (0.1375, 0.0696, 0.0931,  14.9281, 0.1530,  5.4004,     1.0));
 
  package Edit is new 
    Editing.Decimal_Output(Money);
  Money_Picture: Editing.Picture := 
    Editing.To_Picture("#####*_***_***_**9.99");

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

begin
  loop
    declare
      Source: Currencies;
      Amount: Money;
    begin
      Put("Currency ( ");
      for C in Currencies loop
        Currency_IO.Put(C);
        Put(" ");
      end loop;
      Put(") and amount: ");
      Currency_IO.Get(Source); 
      Money_IO.Get(Amount); 
      Skip_Line;
      Edit.Put(Amount, Money_Picture, To_String(Signs(Source))); 
      Put_Line(" is worth "); 
      for Target in Currencies loop
        if Source /= Target then
          Edit.Put(
--            Error: ambiguity because the conversion to Rates
--                   makes both standard * and overloaded * visible
--            Money(Rates(Conversion(Source, Target) * Special) * Amount),
--            Error: standard * is not visible
--            Rates(Conversion(Source, Target) * Special) * Amount,
            Money(Conversion(Source, Target) * Special * Amount),
--            Another possibility is to use the expanded name:
--            Standard."*"(Conversion(Source, Target) * Special, Amount),
            Money_Picture, To_String(Signs(Target))); 
          New_Line; 
        end if;
      end loop;
      New_Line;
    exception
      when Data_Error => Skip_Line; Put_Line("Illegal input");
      when Editing.Picture_Error => Put_Line("Formatting error");
      when Constraint_Error =>      Put_Line("Computation error");
      when End_Error =>             exit;
    end;
  end loop;
end Convert2;
