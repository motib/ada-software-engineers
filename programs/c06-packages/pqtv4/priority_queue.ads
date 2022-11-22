--
-- Priority queue abstract data type implemented as a tree.
-- Fourth attempt.
--
package Priority_Queue is

  type Queue(Size: Positive) is private;

  function  Empty(Q:  in Queue) return Boolean;
  procedure Put(I: in Integer; Q: in out Queue);
  procedure Get(I: out Integer; Q: in out Queue);

  Overflow, Underflow: exception;

private
  type Node;
  type Link is access Node;
  type Node is                    -- Completion of type declaration
    record
      Data: Integer;
      Left, Right: Link;
    end record;

  type Queue(Size: Positive) is   -- Size ignored!
    record
      Root: Link;
    end record;
end Priority_Queue;
