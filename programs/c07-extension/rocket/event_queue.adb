
package body Event_Queue is

  -- Heterogeneous data cannot be directly stored in Node.
  -- Store a pointer to the data.
  type Event_Class_Ptr is access Event'Class;
  
  type Node is
    record
      Data: Event_Class_Ptr;
      Left, Right: Link;
    end record;

  procedure Put(E: in Event'Class; Node_Ptr: in out Link) is
  begin
    if Node_Ptr = null then 
      Node_Ptr := new Node'(new Event'Class'(E), null, null);
    elsif E < Node_Ptr.Data.all then 
      Put(E, Node_Ptr.Left);
    else
      Put(E, Node_Ptr.Right);
    end if;
  end Put;

  procedure Put(E: in Event'Class; Q: in out Queue) is
  begin
    Put(E, Q.Root);
  end Put;

  function Empty(Q: in Queue) return Boolean is
  begin
    return Q.Root = null;
  end Empty;

  procedure Get(Node_Ptr: in out Link; Found: out Link) is
  begin
    if Node_Ptr.Left = null then
      Found := Node_Ptr;
      Node_Ptr := Node_Ptr.Right;
    else
      Get(Node_Ptr.Left, Found);
    end if;
  end Get;  

  function Get(Q: Queue_Ptr) return Event'Class is
    Found: Link;
  begin
    Get(Q.Root, Found);
    return Found.Data.all;
  end Get;  

end Event_Queue;
