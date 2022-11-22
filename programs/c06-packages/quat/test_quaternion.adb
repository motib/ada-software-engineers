with Quaternions; 
use type Quaternions.Quaternion;
procedure Test_Quaternion is
 
  Q: Quaternions.Quaternion := 
        Quaternions.Construct(0.8224, -0.3604, -0.4397, -0.0223);
      -- Equivalent to 30, 45, 60 degrees
begin
  Quaternions.Print(Q);
  Quaternions.Print(Q + Quaternions.K);
  Quaternions.Print(Q * Quaternions.One);
  Quaternions.Print(Q + Q);
  Quaternions.Print(Q * Q);
end Test_Quaternion;

