with Ada.Calendar; with Ada.Strings.Fixed;
separate(Array_Priority_Queue)
function Time_Stamp return String is
  use Ada.Calendar;
  T: Time := Clock;
  Year: Year_Number;
  Month: Month_Number;
  Day: Day_Number;
  Seconds: Day_Duration;
  function Trim(S: String) return String is
  begin
    return Ada.Strings.Fixed.Trim(S, Ada.Strings.Both);
  end Trim;
begin
  Split(T, Year, Month, Day, Seconds);
  return Trim(Year_Number'Image(Year))   & "-" & 
         Trim(Month_Number'Image(Month)) & "-" &
         Trim(Day_Number'Image(Day))     & "-" & 
         Trim(Day_Duration'Image(Seconds));
end Time_Stamp;
