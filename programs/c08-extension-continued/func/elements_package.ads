package Elements_Package is
  type Element is tagged null record;
  function Create return Element;
  procedure Process(E: in Element);
  function Modify_Element(E: Element) return Element;

  function Another1(Original: Element; Copy: Element) 
    return Element'Class;
  function Another2(Original: Element; Copy: Element := Create) 
    return Element'Class;

  type Element1 is new Element with null record;
  function Create return Element1;
  procedure Process(E: in Element1);
  function Modify_Element(E: Element1) return Element1;

  type Element2 is new Element with null record;
  function Create return Element2;
  procedure Process(E: in Element2);
  function Modify_Element(E: Element2) return Element2;
end Elements_Package; 
