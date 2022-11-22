with Ada.Wide_Text_IO; use Ada.Wide_Text_IO;
with Ada.Characters.Conversions;
with Ada.Characters.Latin_1;
procedure Curr is
   Yen:   constant Character := Ada.Characters.Latin_1.Yen_Sign;
   S:     String := "The symbol for the Yen is  " &  Yen;

   -- Convert Integer value in hex to Wide_Character
   Euro1: constant Wide_Character := Wide_Character'Val(16#20AC#);
   WS1:   Wide_String := "The symbol for the Euro is " & Euro1;

   -- Use language-defined name, see ARM 3.5.2(3.2/2)
   Euro2: constant Wide_Character := Wide_Character'Value("Hex_000020AC");
   WS2:   Wide_String := "The symbol for the Euro is " & Euro2;

   -- Gnat syntax, see Gnat Pro User's Guide 2.2.3
   Euro3: constant Wide_Character := '["20AC"]';
   WS3: Wide_String := "The symbol for the Euro is " & Euro3;

   -- Gnat syntax useful in strings
   Euro_Rupee_Yuan: Wide_String :=
     "Euro is ["20AC"], Rupee is ["20A8"], Yuan is ["5143"]";

begin
   Put_Line(Ada.Characters.Conversions.To_Wide_String(S));
   Put_Line(WS1);
   Put_Line(WS2);
   Put_Line(WS3);
   Put_Line(Euro_Rupee_Yuan);
end Curr;
