private with Ada.Numerics.Complex_Types;
package QuaternionsC is

  type Quaternion is private;
  function Construct(X, Y, Z, W: Float) return Quaternion; 
  
  function "+"(Q1, Q2: Quaternion) return Quaternion;
  function "*"(Q1, Q2: Quaternion) return Quaternion;
  procedure Print(Q: in Quaternion);

  One: constant Quaternion;
  I: constant Quaternion;
  J: constant Quaternion;
  K: constant Quaternion;
private

  type Quaternion is
    record
      Z, W: Ada.Numerics.Complex_Types.Complex;
    end record;
  
  One: constant Quaternion := ((1.0, 0.0), (0.0, 0.0));
  I: constant Quaternion  := ((0.0, 1.0), (0.0, 0.0));
  J: constant Quaternion := ((0.0, 0.0), (1.0, 0.0));
  K: constant Quaternion := ((0.0, 0.0), (0.0, 1.0));
  
end QuaternionsC;
