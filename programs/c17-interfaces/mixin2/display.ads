with Root_Event;
generic
  type Item is new Root_Event.Event with private;
package Display is
  type Displayed_Item is new Item with private;
  function Create return Displayed_Item;
  procedure Display_Item(D: in Displayed_Item);
  procedure Set_Size(D: in out Displayed_Item; N: Natural);
  function  Get_Size(D: Displayed_Item) return Natural;
private
  type Displayed_Item is new Item with
    record
      Size: Natural := 10;
    end record;
end Display;
