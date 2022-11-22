with Ada.Numerics.Elementary_Functions;
procedure Main is
  pragma Preelaborate;
  Strange: Float :=
    Ada.Numerics.Elementary_Functions.Sqrt(
      Ada.Numerics.Pi + Ada.Numerics.E);
begin
  null;
end Main;
