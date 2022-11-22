--
-- The program reads a dot file and stores the
--   data in a data structure for processing
-- Current the only processing is to prettyprint
--   the dot file
--
with Element_Vectors;
with Lines, Config;
with Attribute_Maps;
with Ada.Text_IO;
package Dot_Tables is
  type Attribute is (Graphs, Nodes, Edges);
  type Attribute_Map_Arrays is array(Attribute) of Attribute_Maps.Map;

  -- The data are: the name of the graph,
  -- an attribute map for each of graph, node and edge,
  -- and vectors of elements (nodes and edges)
  type Table is
      record
         Graph_Name: Config.Name;
         Attribute_Map_Array: Attribute_Map_Arrays;
         Nodes: Element_Vectors.Vector;
         Edges: Element_Vectors.Vector;
    end record;

   -- Sort the vectors of elements in a table
   procedure Sort(T: in out Table);

   -- Put the table to a file
   procedure Put(T: in Table; Output: in Ada.Text_IO.File_Type);
end Dot_Tables;
