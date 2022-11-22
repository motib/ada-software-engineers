package body Tree_HPQ is
  type Item_Ptr is access Item;
  type Node is
    record
      Data: Item_Ptr;
      Left, Right: Link;
    end record;

  procedure Put(E: in Item; Node_Ptr: in out Link) is
  begin
    if Node_Ptr = null then 
      Node_Ptr := new Node'(new Item'(E), null, null);
    elsif E < Node_Ptr.Data.all then 
      Put(E, Node_Ptr.Left);
    else
      Put(E, Node_Ptr.Right);
    end if;
  end Put;

  procedure Put(E: in Item; Q: access Queue) is
  begin
    Put(E, Q.Root);
  end Put;
  
  function Empty(Q: access Queue) return Boolean is
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

  function Get(Q: access Queue) return Item is
    Found: Link;
  begin
    if Q.Root = null then raise Underflow; end if;
    Get(Q.Root, Found);
    return Found.Data.all;
  end Get;  
end Tree_HPQ;
