with Ada.Text_IO; use Ada.Text_IO;
procedure Country1 is
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
  -- Associate country with car using a case statement
  begin
    case C is
      when Ford | Chevrolet..Pontiac | Chrysler..Dodge 
                               => return US;
      when Rover | Rolls_Royce => return UK;
      when Peugeot..Citroen    => return France;
      when BMW..Opel           => return Germany;
      when Honda..Toyota       => return Japan;
      when Daewoo | Hyundai    => return Korea;
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
end Country1;

