  with Ada.Text_IO; use Ada.Text_IO;  -- Additional context clauses
  separate(P.Inner)
  procedure Proc2 is
  begin
    Put_Line(S & " visible from Proc2");
  end Proc2;
