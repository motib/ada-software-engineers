--
-- An Element is a node (source name, no target name)
--   or an edge (source and target names)
-- Each element has an attribute map associated with it
--
with Config;
with Attribute_Maps;
package Elements is
   Blanks: constant Config.Name := (others => ' ');
   type Element is
      record
         Source: Config.Name;
         Target: Config.Name := Blanks;
         Attributes: Attribute_Maps.Map := Attribute_Maps.Empty_Map;
      end record;

   -- Only source and target names are used for comparisons
   function "="(Left, Right: Element) return Boolean;
   function "<"(Left, Right: Element) return Boolean;
end Elements;
