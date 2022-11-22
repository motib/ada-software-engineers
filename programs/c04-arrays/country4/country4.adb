--
-- Read the manufacturer of a car and write the country
--   of origin of the car.
-- Constant array.
--
with Ada.Text_IO; use Ada.Text_IO;
procedure Country4 is
  type Cars is
    (Ford, Chevrolet, Pontiac, Chrysler, Dodge,
     Rover, Rolls_Royce,
     Peugeot, Renault, Citroen,
     BMW, Volkswagen, Opel,
     Honda, Mitsubishi, Toyota,
     Daewoo, Hyundai
    );

  type Countries is (US, UK, France, Germany, Japan, Korea);

  Car_to_Country : constant array (Cars) of Countries :=
   (Ford .. Dodge              => US,
    Rover .. Rolls_Royce       => UK,
    Honda .. Toyota            => Japan,
    Peugeot | Renault | Citroen=> France,
    BMW | Volkswagen | Opel    => Germany,
    Daewoo .. Hyundai          => Korea);

  Car : Cars;

begin
  loop
    Put ("Enter the make of the car: ");
    Car := Cars'Value (Get_Line);
    Put_Line
     (Cars'Image (Car) &
      " is made in " &
      Countries'Image (Car_to_Country (Car)));
  end loop;
exception
  when Constraint_Error =>
    Put_Line ("Car make is not recognized");
  when End_Error =>
    null;
end Country4;
