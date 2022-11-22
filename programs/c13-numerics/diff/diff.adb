with Ada.Text_IO;
with Euler;
procedure Diff is

  type Real is digits 6;
  type Vector is array(Integer range <>) of Real;
  type Ptr is access function (X: Real) return Real;

  procedure Solve is new Euler(Real, Vector, Ptr);

  function Ident(X: Real) return Real is
  begin
    return X;
  end Ident;

  package Real_IO is new Ada.Text_IO.Float_IO(Real);
  use Real_IO;

  Answer: Vector(1..21);

begin
  Solve(Ident'Access, 1.0, 0.05, Answer);
  for N in Answer'Range loop
    Put(0.05 * Real(N-1), Exp => 0);
    Put( Answer(N), Exp => 0);
    Ada.Text_IO.New_Line;
  end loop;
end Diff;

