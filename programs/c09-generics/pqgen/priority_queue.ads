--
-- Priority queue abstract data type implemented as a tree.
-- Queue is limited private; representation of nodes is in body.
-- Queue element is generic.
--
generic
  type Item is private;
  with function "<"(Left, Right: Item) return Boolean is <>;
package Priority_Queue is

  type Queue(Size: Positive) is limited private;

  function  Empty(Q:  in Queue) return Boolean;
  procedure Put(I: in Item; Q: in out Queue);
  procedure Get(I: out Item; Q: in out Queue);

  Overflow, Underflow: exception;

private
  type Node;                      -- Completion in body
  type Link is access Node;
  type Queue(Size: Positive) is   -- Size ignored!
    record
      Root: Link;
    end record;
end Priority_Queue;
