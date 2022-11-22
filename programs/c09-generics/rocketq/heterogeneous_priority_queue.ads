
generic
  type Item(<>) is private;  -- Object of type Item never declared
  with function "<"(Left, Right: Item) return Boolean is <>;
package Heterogeneous_Priority_Queue is

  type Queue is limited private;

  function  Empty(Q: in Queue) return Boolean;
  procedure Put(E: in Item; Q: in out Queue);
  function  Get(Q: access Queue) return Item;

private
--
--  Implement as tree.
-- 
  type Node; 
  type Link is access Node;
  type Queue is
    record
      Root: Link;
    end record;
end Heterogeneous_Priority_Queue;
