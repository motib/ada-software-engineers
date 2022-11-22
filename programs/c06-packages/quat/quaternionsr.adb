with Ada.Text_IO, Ada.Float_Text_IO;
package body QuaternionsR is

  function Construct(X, Y, Z, W: Float) return Quaternion is
  begin
    return (X, Y, Z, W);
  end Construct;

  function "+"(Q1, Q2: Quaternion) return Quaternion is
  begin
    return (Q1.X+Q2.X, Q1.Y+Q2.Y, Q1.Z+Q2.Z, Q1.W+Q2.W);
  end "+";
  
  
  function "*"(Q1, Q2: Quaternion) return Quaternion is
  begin
    return Q: Quaternion do
      Q.X := Q1.X*Q2.X - Q1.Y*Q2.Y - Q1.Z*Q2.Z - Q1.W*Q2.W;
      Q.Y := Q1.X*Q2.Y + Q1.Y*Q2.X + Q1.Z*Q2.W - Q1.W*Q2.Z;
      Q.Z := Q1.X*Q2.Z - Q1.Y*Q2.W + Q1.Z*Q2.X + Q1.W*Q2.Y;
      Q.W := Q1.X*Q2.W + Q1.Y*Q2.Z - Q1.Z*Q2.Y + Q1.W*Q2.X;
    end return;
  end "*";
  
  procedure Print(Q: in Quaternion) is
    use Ada.Text_IO, Ada.Float_Text_IO;
  begin
    Put("(");
    Put(Q.X, Fore => 2, Aft => 4, Exp => 0); Put(", ");
    Put(Q.Y, Fore => 2, Aft => 4, Exp => 0); Put(", ");
    Put(Q.Z, Fore => 2, Aft => 4, Exp => 0); Put(", ");
    Put(Q.W, Fore => 2, Aft => 4, Exp => 0);
    Put_Line(")");
  end Print;

end QuaternionsR;
