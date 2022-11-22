package Matrices is
  type Matrix is interface;
  function Element (M: Matrix; X, Y: Natural) 
    return Float is abstract;
  procedure Set_Element
    (M: in out Matrix; X, Y: in Natural; Value: in Float) is abstract;
  procedure Zero(M: in out Matrix) is abstract;

  function Rows(M: Matrix) return Natural is abstract;
  function Cols(M: Matrix) return Natural is abstract;
  function "="(M1, M2: Matrix) return Boolean is abstract;
end Matrices;
