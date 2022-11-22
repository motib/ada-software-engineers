--
-- An attribute map maps a key to a value,
--   for example, "color = red"
--
with Config;
with Ada.Containers.Ordered_Maps;
package Attribute_Maps is new
  Ada.Containers.Ordered_Maps(Config.Name, Config.Name);
