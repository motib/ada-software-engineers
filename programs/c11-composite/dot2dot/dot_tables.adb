with Ada.Text_IO;
with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Elements;
with Element_Vectors;
package body Dot_Tables is

   package Element_Sort is
     new Element_Vectors.Generic_Sorting(Elements."<");

   -- Sort the elements in a table
   procedure Sort(T: in out Table) is
   begin
     Element_Sort.Sort(T.Nodes);
     Element_Sort.Sort(T.Edges);
   end Sort;

   function Trim (
     Source: in String; Side: in Ada.Strings.Trim_End := Ada.Strings.Right)
       return String
     renames Ada.Strings.Fixed.Trim;

   procedure Put(T: in Table; Output: in Ada.Text_IO.File_Type) is
      use Ada.Text_IO;

      -- Put an attribute (key=value) at Position in a map
      procedure Put_Attribute(Position: in Attribute_Maps.Cursor) is
      begin
         Put(Output, Trim(Attribute_Maps.Key(Position)) & " = " &
             Trim(Attribute_Maps.Element(Position)) & ' ');
      end Put_Attribute;

      -- Put an element (node or edge) with its attribute list
      procedure Put_Element(Position: in Element_Vectors.Cursor) is
           E: Elements.Element renames Element_Vectors.Element(Position);
      begin
         -- Put node or source of edge
         Put(Output, Trim(E.Source));
         -- For edge, put target
         if E.Target /= Elements.Blanks then
            Put(Output, " -> " & Trim(E.Target));
         end if;
         -- Put attribute list
         if not Attribute_Maps.Is_Empty(E.Attributes) then
            Put(Output, " [ ");
            Attribute_Maps.Iterate(
              E.Attributes,
              Put_Attribute'Access);
            Put(Output, "]");
         end if;
         Put_Line(Output, ";");
      end Put_Element;

   begin
      -- Write digraph line
      Put_Line(Output, "digraph " & Trim(T.Graph_Name) & "  {");

      -- Write graph, node and edge attributes
      for A in Attribute loop
         Put(Output, "  " &
             Ada.Characters.Handling.To_Lower(Attribute'Image(A)) &
             " [ ");
         Attribute_Maps.Iterate(
           T.Attribute_Map_Array(A),
           Put_Attribute'Access);
         Put_Line(Output, "]");
      end loop;

      -- Write nodes
      Element_Vectors.Iterate(T.Nodes, Put_Element'Access);

      -- Write edges
      Element_Vectors.Iterate(T.Edges, Put_Element'Access);

      -- Write final brace
      Put_Line(Output, "}");
   end Put;
end Dot_Tables;
