with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type Parent(Number: Positive; Size: Positive) is 
    record  
      X: String(1..Number);
      Y: String(1..Size);
    end record;
  type Derived(Count: Positive) is new Parent(Count, Count);

  P: Parent  := (2, 3, "ab", "cde");
  D: Derived := (3, "uvw", "xyz");
begin
  D := Derived(P);  
  Put_Line(D.X);   Put_Line(D.Y);
end Main;

