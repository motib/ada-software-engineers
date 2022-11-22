package QuaternionsR is

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
      X, Y, Z, W: Float := 0.0;
    end record;

  One: constant Quaternion := (1.0, 0.0, 0.0, 0.0);
  I: constant Quaternion  := (0.0, 1.0, 0.0, 0.0);
  J: constant Quaternion := (0.0, 0.0, 1.0, 0.0);
  K: constant Quaternion := (0.0, 0.0, 0.0, 1.0);
  
end QuaternionsR;
