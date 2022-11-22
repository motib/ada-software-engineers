with Ada.Numerics.Generic_Complex_Types;
with Ada.Numerics.Generic_Complex_Elementary_Functions;
generic
  use Ada.Numerics;
  with package Complex_Types is 
    new Generic_Complex_Types (<>);
  with package Complex_Functions is 
    new Generic_Complex_Elementary_Functions(Complex_Types);
package Generic_Complex_Vectors is
  type Vector(<>) is private;
  function Initialize return Vector;
  function Distance(Left, Right: Vector) return Complex_Types.Real'Base;
private
  type Vector is array(Integer range <>) of Complex_Types.Complex;
end Generic_Complex_Vectors; 
