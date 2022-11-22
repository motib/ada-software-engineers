--
-- Vector of Elements (nodes and edges)
--
with Ada.Containers.Vectors;
with Elements; use Elements;
package Element_Vectors is
  new Ada.Containers.Vectors(Natural, Element);
