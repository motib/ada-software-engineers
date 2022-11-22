with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
package body Priority_Queue is

  function Create(I: Integer) return Node is
  begin
    return (Ada.Finalization.Controlled with I, null, null);
  end Create;

  function Value(N: Node) return Integer is
  begin
    return N.Data;
  end Value;

  procedure Initialize(Object: in out Node) is
  begin
    Put_Line("Initialize" & Integer'Image(Object.Data));
  end Initialize;

  procedure Adjust(Object: in out Node) is
  begin
    Put_Line("Adjust    " & Integer'Image(Object.Data));
  end Adjust;

  procedure Finalize(Object: in out Node) is
  begin
    Put_Line("Finalize  " & Integer'Image(Object.Data));
  end Finalize;

  function Empty(Q: in Queue) return Boolean is
  begin
    return Q.Root = null;
  end Empty;

  procedure Put(N: in Node; Node_Ptr: in out Link) is
  begin
    if Node_Ptr = null then 
      Node_Ptr := 
        new Node'(Ada.Finalization.Controlled with N.Data, null, null);
    elsif N.Data < Node_Ptr.Data then 
      Put(N, Node_Ptr.Left);
    else
      Put(N, Node_Ptr.Right);
    end if;
  end Put;

  procedure Put(N: in Node; Q: in out Queue) is
  begin
    Put(N, Q.Root);
  end Put;

  procedure Free_Node is new Ada.Unchecked_Deallocation(Node, Link);

  procedure Get(N: out Node; Node_Ptr: in out Link) is
    Save: Link := Node_Ptr;
  begin
    if Node_Ptr.Left = null then
      N := Node_Ptr.all;
      Node_Ptr := Node_Ptr.Right;  
      Free_Node(Save);
    else
      Get(N, Node_Ptr.Left);
    end if;
  end Get;  

  procedure Get(N: out Node; Q: in out Queue) is
  begin
    if Q.Root = null then 
      raise Underflow; 
    end if;
    Get(N, Q.Root);
  end Get;  
end Priority_Queue;
