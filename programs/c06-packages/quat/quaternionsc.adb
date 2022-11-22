with Ada.Text_IO, Ada.Complex_Text_IO;
package body QuaternionsC is
  use Ada.Numerics.Complex_Types;

  function Construct(X, Y, Z, W: Float) return Quaternion is
  begin
    return ((X, Y), (Z, W));
  end Construct;

  function "+"(Q1, Q2: Quaternion) return Quaternion is
  begin
    return (Q1.Z+Q2.Z, Q1.W+Q2.W); 
  end "+";
  
  function "*"(Q1, Q2: Quaternion) return Quaternion is
  begin
    return Q: Quaternion do
      Q.Z := Q1.Z*Q2.Z + Q1.W*Conjugate(-Q2.W);
      Q.W := Q1.Z*Q2.W + Q1.W*Conjugate(Q2.Z);
    end return;
  end "*";
  
  procedure Print(Q: in Quaternion) is
    use Ada.Text_IO, Ada.Complex_Text_IO;
  begin
    Put("(");
    Put(Q.Z, Fore => 2, Aft => 4, Exp => 0); Put(", ");
    Put(Q.W, Fore => 2, Aft => 4, Exp => 0);
    Put_Line(")");
  end Print;

end QuaternionsC;
