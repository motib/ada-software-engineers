
package body Data_Structure is
  procedure Put(E: in Element'Class; On: access Structure) is
  begin
    On.Data := new Element'Class'(E);
  end Put;
  function  Get(From: access Structure) return Element'Class is
    Temp: Element_Ptr := From.Data;
  begin
    From.Data := null;
    return Temp.all;
  end Get;
end Data_Structure;
