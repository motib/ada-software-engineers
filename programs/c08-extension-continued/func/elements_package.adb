
with Ada.Text_IO; use Ada.Text_IO;
package body Elements_Package is
  function Create return Element is
  begin
    Put_Line("Creating Element"); 
    return Element'(null record);
  end Create;
  procedure Process(E: in Element) is
  begin
    Put_Line("Hi from Element");
  end Process;
  function Modify_Element(E: Element) return Element is
  begin
    Put_Line("Modifying Element");
    return Element'(null record);
  end Modify_Element;

  function Another1(Original: Element; Copy: Element) 
    return Element'Class is
  begin
    return Element'Class(Copy);
  end Another1;

  function Another2(Original: Element; Copy: Element := Create) 
    return Element'Class is
  begin
    return Element'Class(Copy);
  end Another2;

  function Create return Element1 is
  begin
    Put_Line("Creating Element1");
    return Element1'(null record);
  end Create;
  procedure Process(E: in Element1) is
  begin
    Put_Line("Hi from Element1");
  end Process;
  function Modify_Element(E: Element1) return Element1 is
  begin
    Put_Line("Modifying Element1");
    return E;
  end Modify_Element;

  function Create return Element2 is
  begin
    Put_Line("Creating Element2");
    return Element2'(null record);
  end Create;
  procedure Process(E: in Element2) is
  begin
    Put_Line("Hi from Element2");
  end Process;
  function Modify_Element(E: Element2) return Element2 is
  begin
    Put_Line("Modifying Element2");
    return E;
  end Modify_Element;
end Elements_Package; 
