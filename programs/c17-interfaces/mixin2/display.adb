with Ada.Text_IO;
package body Display is
  function Create return Displayed_Item is
  begin
    return (Item'(Create) with Size => <>);
  end Create;

  procedure Display_Item(D: in Displayed_Item) is
  begin
    Ada.Text_IO.Put_Line(
      "Size = " & Integer'Image(D.Size) & ", " & Format(Item(D)));
  end Display_Item;

  procedure Set_Size(D: in out Displayed_Item; N: Natural) is
  begin
    D.Size := N;
  end Set_Size;

  function Get_Size(D: Displayed_Item) return Natural is
  begin
    return D.Size;
  end Get_Size;

end Display;
