
with Data_Structure; use Data_Structure;
with Elements_Package; use Elements_Package; 
with Ada.Text_IO; use Ada.Text_IO;
procedure Func is
  S: aliased Structure;
begin                                         -- Expected output
  Put_Line("Ordinary dispatching");           -- Ordinary dispatching
  Put(Element2'(Create), On=>S'Access);       -- Creating Element2
  declare
    EC: Element'Class := Get(From=>S'Access);
  begin
    Process(EC);                              -- Hi from Element2

    Put_Line("Tag indeterminate operand");    -- Tag indeterminate operand
    Put(Another1(EC, Create), On=>S'Access);  -- Creating Element2
    Process(Get(From=>S'Access));             -- Hi from Element2

    Put_Line("Tag indeterminate default");    -- Tag indeterminate default
    Put(Another2(EC), On=>S'Access);          -- Creating Element2
    Process(Get(From=>S'Access));             -- Hi from Element2

    Put_Line("Tag indeterminate assignment"); -- Tag indeterminate assignment
    EC := Element'(Create);                   -- Creating Element2
    Put(EC, On=>S'Access);
    Process(Get(From=>S'Access));             -- Hi from Element2

    Put_Line("Nested tag indeterminate");     -- Nested tag indeterminate
    EC := Element'(Modify_Element(Create));   -- Creating Element2
                                              -- Modifying Element2
    Put(EC, On=>S'Access);
    Process(Get(From=>S'Access));             -- Hi from Element2

    Put_Line("Nested tag indeterminate");     -- Nested tag indeterminate
    Put(Another1(EC, Modify_Element(Create)), On=>S'Access);
                                              -- Creating Element2   
                                              -- Modifying Element2
    Process(Get(From=>S'Access));             -- Hi from Element2
  end;
  Put_Line("No dispatching");                 -- No dispatching
  declare
    EC: Element'Class := Element'(Create);    -- Creating Element
  begin
    Process(EC);                              -- Hi from Element
  end;
end Func;

