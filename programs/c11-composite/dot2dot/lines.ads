--
-- The input line is a bounded string of length given in Config
--
with Config;
with Ada.Strings.Bounded;
package Lines is new
  Ada.Strings.Bounded.Generic_Bounded_Length(Config.Line_Length);
