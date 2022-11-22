with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Vectors;
procedure Main is
  package Float_Vector is
    new Ada.Containers.Vectors(Natural, Float);
  V: Float_Vector.Vector;
begin
  Put_Line(Ada.Containers.Count_Type'Image(V.Length));
end Main;
