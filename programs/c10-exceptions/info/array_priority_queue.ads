package Array_Priority_Queue is 
  type Queue(Size: Positive) is limited private;

  function  Empty(Q:  in Queue) return Boolean;
  procedure Put(I: in Integer;  Q: in out Queue);
  procedure Get(I: out Integer; Q: in out Queue);

  Overflow, Underflow: exception;
private
  type Vector is array(Natural range <>) of Integer;
  type Queue(Size: Positive) is
    record
      Data: Vector(0..Size);
      Free: Natural := 0;
    end record;
end Array_Priority_Queue;
