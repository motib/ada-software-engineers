package body Elements is
  function "="(Left, Right: Element) return Boolean is
  begin
      return Left.Source = Right.Source and then
             Left.Target = Left.Target;
  end "=";

   function "<"(Left, Right: Element) return Boolean is
  begin
      return Left.Source < Right.Source or else
             (Left.Source = Right.Source and
             Left.Target < Right.Target);
  end "<";
end Elements;
