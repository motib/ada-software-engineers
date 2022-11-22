
with Elements_Package; use Elements_Package;
package Data_Structure is
  type Structure is limited private;
  procedure Put(E: in Element'Class; On: access Structure);
  function  Get(From: access Structure) return Element'Class;
private
  type Element_Ptr is access all Element'Class;
  type Structure is
    record
      Data: Element_Ptr;
    end record;
end Data_Structure;
