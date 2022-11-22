--
-- Text_IO for bounded string Line
--
with Lines;
with Ada.Text_IO.Bounded_IO;
package Lines_IO is
   new Ada.Text_IO.Bounded_IO(Lines);
