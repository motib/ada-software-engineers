with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure PQTAccess is
  type Node is
    record
      Data: Integer;
      Left, Right: access Node;
    end record;

  type Queue is
    record
      Root: access Node;
    end record;

  Overflow, Underflow: exception;

  function  Empty(Q:  in Queue) return Boolean is
  begin
    return Q.Root = null;
  end Empty;

  procedure Put(I: in Integer; Node_Ptr: access Node) is
  begin
    if I < Node_Ptr.Data then
      if Node_Ptr.Left = null then
        Node_Ptr.Left := new Node'(I, null, null);
      else
        Put(I, Node_Ptr.Left);
      end if;
    else 
      if Node_Ptr.Right = null then
        Node_Ptr.Right := new Node'(I, null, null);
      else
        Put(I, Node_Ptr.Right);
      end if;
    end if;
  end Put;

  procedure Put(I: in Integer; Q: in out Queue) is
  begin
    if Q.Root = null then
      Q.Root := new Node'(I, null, null);
    else
      Put(I, Q.Root);
    end if;
  end Put;

  procedure Get(I: out Integer; Node_Ptr: access Node) is
  begin
    if Node_Ptr.Left.Left = null then
      I := Node_Ptr.Left.Data;
      Node_Ptr.Left := Node_Ptr.Left.Right;
    else
      Get(I, Node_Ptr.Left);
    end if;
  end Get;

  procedure Get(I: out Integer; Q: in out Queue) is
  begin
    if Q.Root = null then
      raise Underflow;
    elsif Q.Root.Left = null then
      I := Q.Root.Data;
      Q.Root := Q.Root.Right;
    else
      Get(I, Q.Root);
    end if;
  end Get;

  Q: Queue;
  I: Integer;
  Test_Data: array(Positive range <>) of Integer :=
    (10, 5, 0, 25, 15, 30, 15, 20, -6, 40);

begin
  for N in Test_Data'Range loop
    Put(Test_Data(N), Width => 5);
    Put(Test_Data(N), Q);
  end loop;
  New_Line;

  while not Empty(Q) loop
    Get(I, Q);
    Put(I, Width => 5);
  end loop;
  New_Line;

  Get(I, Q);  -- Test underflow

exception
  when Underflow => Put_Line("Underflow from queue");
  when Overflow  => Put_Line("Overflow  from queue");
end PQTAccess;
