
package body Event_Queue is

procedure Put(E: access Event'Class; Node_Ptr: in out Link) is
begin
  if Node_Ptr = null then 
    Node_Ptr := E.Inner'Access;
  elsif E.all < Node_Ptr.E.all then 
    Put(E, Node_Ptr.Left);
  else
    Put(E, Node_Ptr.Right);
  end if;
end Put;

procedure Put(E: access Event'Class; Q: access Queue) is
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

function Get(Q: access Queue) return access Event'Class is
  Found: Link;
begin
  Get(Q.Root, Found);
  return Found.E;
end Get;  

end Event_Queue;
