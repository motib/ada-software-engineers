package Display is
  type Displayable is interface;
  function  Format(D:   Displayable) return String is abstract;
  procedure Set_Size(D: in out Displayable; N: Natural) is abstract;
  function  Get_Size(D: Displayable) return Natural is abstract;

  procedure Display_Item(D: in Displayable'Class);
end Display;
