
package body Priority_Queue is

  type Node is                    -- Completion of type declaration
    record
      Data: Item;
      Left, Right: Link;
    end record;

  function  Empty(Q:  in Queue) return Boolean is
  begin
    return Q.Root = null;
  end Empty;

  procedure Put(I: in Item; Node_Ptr: in out Link) is
  -- Recursive procedure to insert in queue
  begin
    if Node_Ptr = null then 
      Node_Ptr := new Node'(I, null, null); 
    elsif I < Node_Ptr.Data then 
      Put(I, Node_Ptr.Left);
    else
      Put(I, Node_Ptr.Right);
    end if;
  end Put;

  procedure Put(I: in Item; Q: in out Queue) is
  begin
    Put(I, Q.Root);
  exception
    when Storage_Error => raise Overflow;  -- Unlikely!!
  end Put;

  procedure Get(I: out Item; Node_Ptr: in out Link) is
  -- Recursive procedure to remove from queue
  begin
    if Node_Ptr.Left = null then
      I := Node_Ptr.Data;
      Node_Ptr := Node_Ptr.Right;  -- Node becomes garbage
    else
      Get(I, Node_Ptr.Left);
    end if;
  end Get;  

  procedure Get(I: out Item; Q: in out Queue) is
  begin
    if Q.Root = null then 
      raise Underflow; 
    end if;
    Get(I, Q.Root);
  end Get;  

end Priority_Queue;
