with Signals, Signals_Complex, Signals_Complex_Vectors;
with Ada.Text_IO;
procedure Signal_Test is
  use Signals_Complex_Vectors;
  V1: Vector := Initialize;
  V2: Vector := Initialize;
  R:  Signals.Real;
begin
  R := Signals_Complex_Vectors.Distance(V1, V2);
  Ada.Text_IO.Put_Line(Signals.Real'Image(R));
end Signal_Test;
