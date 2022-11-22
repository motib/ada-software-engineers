--
-- Read the manufacturer of a car and write the country
--   of origin of the car.
-- Subtypes
--
with Ada.Text_IO; use Ada.Text_IO;
procedure Country2 is
  type Cars is
    (Ford, Chevrolet, Pontiac, Chrysler, Dodge,
     Rover, Rolls_Royce,
     Peugeot, Renault, Citroen,
     BMW, Volkswagen, Opel,
     Honda, Mitsubishi, Toyota,
     Daewoo, Hyundai
    );

  type Countries is (US, UK, France, Germany, Japan, Korea);

  function Car_to_Country(C: Cars) return Countries is
  -- Associate country with car using subtypes
    subtype US_Car       is Cars range Ford..Dodge;
    subtype UK_Car       is Cars range Rover..Rolls_Royce;
    subtype French_Car   is Cars range Peugeot..Citroen;
    subtype German_Car   is Cars range BMW..Opel;
    subtype Japanese_Car is Cars range Honda..Toyota;
    subtype Korean_Car   is Cars range Daewoo..Hyundai;
  begin
    case C is
      when US_Car     => return US;
      when UK_Car       => return UK;
      when French_Car   => return France;
      when German_Car   => return Germany;
      when Japanese_Car => return Japan;
      when Korean_Car  => return Korea;
    end case;
  end Car_to_Country;

  Car:     Cars;

begin
  loop
    Put("Enter the make of the car: ");
    Car := Cars'Value(Get_Line);
    Put_Line(Cars'Image(Car) & " is made in " &
      Countries'Image(Car_to_Country(Car)));
  end loop;
exception
  when Constraint_Error =>
      Put_Line("Car make is not recognized");
   when End_Error =>
      null;
end Country2;
