--
-- Solving a differential equation.
-- Demonstrates generic floating point type.
--
generic
  type Float_Type is digits <>;
  type Vector is array(Integer range <>) of Float_Type;
  type Function_Ptr is access function (X: Float_Type) return Float_Type;
procedure Euler(
  F: in Function_Ptr; Init, H: in Float_Type; Result: out Vector);
