--
-- Priority queue abstract data type implemented as an array.
-- Second attempt.
--
package Priority_Queue is 

  type Vector is array(Natural range <>) of Integer;
  type Queue(Size: Positive) is
    record
      Data: Vector(0..Size);  -- Extra slot for sentinel
      Free: Natural := 0;
    end record;

  function  Empty(Q:  in Queue) return Boolean;
  procedure Put(I: in Integer;  Q: in out Queue);
  procedure Get(I: out Integer; Q: in out Queue);

  Overflow, Underflow: exception;

end Priority_Queue;
