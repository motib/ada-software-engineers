--
-- Priority queue abstract data type implemented as an array.
-- Third attempt.
--
package Priority_Queue is

  type Queue(Size: Positive);

  function  Empty(Q:  in Queue) return Boolean;
  procedure Put(I: in Integer;  Q: in out Queue);
  procedure Get(I: out Integer; Q: in out Queue);

  Overflow, Underflow: exception;

end Priority_Queue;
