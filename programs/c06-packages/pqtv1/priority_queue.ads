--
-- Priority queue abstract data type implemented as a tree.
-- First attempt.
--
package Priority_Queue is 

  function  Empty return Boolean;
  procedure Put(I: in Integer);
  procedure Get(I: out Integer);

  Overflow, Underflow: exception;

end Priority_Queue;
