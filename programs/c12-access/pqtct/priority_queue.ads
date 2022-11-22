--
-- Priority queue abstract data type implemented as a tree.
-- Nodes are controlled
--
with Ada.Finalization;
package Priority_Queue is
  type Node is new Ada.Finalization.Controlled with private;
  function Create(I: Integer) return Node;
  function Value(N: Node) return Integer;

  type Queue(Size: Positive) is limited private;
  function  Empty(Q:  in Queue) return Boolean;
  procedure Put(N: in  Node; Q: in out Queue);
  procedure Get(N: out Node; Q: in out Queue);
  Overflow, Underflow: exception;
private
  type Link is access Node;
  type Node is new Ada.Finalization.Controlled with
    record
      Data: Integer := 0;
      Left, Right: Link;
    end record;
  procedure Initialize(Object: in out Node);
  procedure Adjust(Object:     in out Node);
  procedure Finalize(Object:   in out Node);

  type Queue(Size: Positive) is 
    record
      Root: Link;
    end record;
end Priority_Queue;
