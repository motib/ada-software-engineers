package body Generic_Complex_Vectors is
  use Complex_Types;
  function Initialize return Vector is
  begin
    return ((1.0,2.0), (2.0,1.0));
  end Initialize;

  function Distance(Left, Right: Vector) return Real'Base is
    Sum: Complex := Compose_From_Cartesian(0.0, 0.0);
  begin
    for N in Left'Range loop
      Sum := Sum + Left(N) * Right(N);
    end loop;
    return abs(Complex_Functions.Sqrt(Sum));
  end Distance;
end Generic_Complex_Vectors; 
