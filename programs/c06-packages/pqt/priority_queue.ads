--
-- Priority queue abstract data type implemented as a tree.
-- Queue is limited private, representation of nodes in body.
--
package Priority_Queue is
  type Queue(Size: Positive) is limited private;

  function  Empty(Q:  in Queue) return Boolean;
  procedure Put(I: in Integer; Q: in out Queue);
  procedure Get(I: out Integer; Q: in out Queue);

  Overflow, Underflow: exception;

private
  type Node;                      -- Completion in body
  type Link is access Node;
  type Queue(Size: Positive) is   -- Size ignored!
    record
      Root: Link;
    end record;
end Priority_Queue;
