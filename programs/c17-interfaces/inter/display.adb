with Ada.Text_IO;
package body Display is
  procedure Display_Item(D: in Displayable'Class) is
  begin
    Ada.Text_IO.Put_Line(
      "Size = " & Integer'Image(D.Get_Size) & ", " & D.Format);
  end Display_Item;
end Display;
