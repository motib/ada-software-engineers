--
-- Priority queue implemented as a tree.
--
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure ProgPQT is

  type Node;
  type Link is access Node;
  type Node is
    record
      Data: Integer;
      Left, Right: Link;
    end record;

  type Queue is
    record
      Root: Link;
    end record;

  Overflow, Underflow: exception;

  function  Empty(Q:  in Queue) return Boolean is
  begin
    return Q.Root = null;
  end Empty;

  procedure Put(I: in Integer; Node_Ptr: in out Link) is
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

  procedure Put(I: in Integer; Q: in out Queue) is
  begin
    Put(I, Q.Root);
  end Put;

  procedure Get(I: out Integer; Node_Ptr: in out Link) is
  -- Recursive procedure to remove from queue
  begin
    if Node_Ptr.Left = null then
      I := Node_Ptr.Data;
      Node_Ptr := Node_Ptr.Right;  -- Node becomes garbage
    else
      Get(I, Node_Ptr.Left);
    end if;
  end Get;

  procedure Get(I: out Integer; Q: in out Queue) is
  begin
    if Q.Root = null then
      raise Underflow;
    end if;
    Get(I, Q.Root);
  end Get;

  Q: Queue;
  I: Integer;                   -- Element of the queue
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

  Get(I,Q);  -- Test underflow

exception
  when Underflow => Put_Line("Underflow from queue");
  when Overflow  => Put_Line("Overflow  from queue");
end ProgPQT;
