package body Heterogeneous_Priority_Queue is

  type Item_Ptr is access Item;
  type Node is
    record
      Data: Item_Ptr;
      Left, Right: Link;
    end record;
    
  procedure Put_On_Tree(E: in Item; Node_Ptr: in out Link) is
  begin
    if Node_Ptr = null then 
      Node_Ptr := new Node'(new Item'(E), null, null);
    elsif E < Node_Ptr.Data.all then 
      Put_On_Tree(E, Node_Ptr.Left);
    else
      Put_On_Tree(E, Node_Ptr.Right);
    end if;
  end Put_On_Tree;

  procedure Put(E: in Item; Q: in out Queue) is
  begin
    Q.L.Put(E, Q);
  end Put;

  procedure Get_From_Tree(Node_Ptr: in out Link; Found: out Link) is
  begin
    if Node_Ptr.Left = null then
      Found := Node_Ptr;
      Node_Ptr := Node_Ptr.Right;
    else
      Get_From_Tree(Node_Ptr.Left, Found);
    end if;
  end Get_From_Tree;  

  function Get(Q: access Queue) return Item is
    Found: Link;
  begin
    Q.L.Get(Q, Found);
    return Found.Data.all;
  end Get;  

  protected body Lock is

    procedure Put(E: in Item; Q: in out Queue) is
    begin
      Put_On_Tree(E, Q.Root);
      Empty := False;
    end Put;

    entry Get(Q: access Queue; Found: out Link) 
      when not Empty is
    begin
      Get_From_Tree(Q.Root, Found);
      Empty := Q.Root = null;
    end Get;

  end Lock;

end Heterogeneous_Priority_Queue;
