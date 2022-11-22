--
-- Hardware interface using ordinary fixed point types.
--
with Interfaces; with Ada.Unchecked_Conversion;
with Ada.Text_IO; use Ada.Text_IO;
procedure Temp is
  Sensor: Interfaces.Integer_16 := 2#0_001_0001_0001_1100#; 
   -- 256 + 16 + 1 + 1/2 + 1/4 = 273.75

  type Temperatures is delta 2.0**(-4) range -2048.0..2047.0;
  for Temperatures'Size use 16;
  for Temperatures'Small use 2.0**(-4);

  function To_Temp is new Ada.Unchecked_Conversion(
    Source => Interfaces.Integer_16, Target => Temperatures);
begin
  Put_Line(Temperatures'Image(To_Temp(Sensor)));
end Temp;

