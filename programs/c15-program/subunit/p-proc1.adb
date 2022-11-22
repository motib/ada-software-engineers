  with Ada.Text_IO; use Ada.Text_IO;  -- Additional context clauses
  separate(P)      -- Subunit
  procedure Proc1 is
  begin
    Put_Line(S & " visible from Proc1");
    Inner.Proc2;
  end Proc1;
