with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure ProgPQA is

  type Vector is array(Natural range <>) of Integer;
  type Queue(Size: Positive) is
    record
      Data: Vector(0..Size);
      Free: Natural := 0;
    end record;

  Overflow, Underflow: exception;

  function  Empty(Q:  in Queue) return Boolean is
  begin
    return Q.Free = 0;
  end Empty;

  procedure Put(I: in Integer; Q: in out Queue) is
    Index: Integer range Q.Data'Range := 0;
  begin
    if Q.Free = Q.Size then
      raise Overflow;
    end if;

    -- Sentinel search for place to insert
    Q.Data(Q.Free) := I;
    while Q.Data(Index) < I loop
      Index := Index+1;
    end loop;

    -- Move elements to free space and insert I
    if Index < Q.Free then
      Q.Data(Index+1..Q.Free) := Q.Data(Index..Q.Free-1);
      Q.Data(Index) := I;
    end if;
    Q.Free := Q.Free+1;
  end Put;

  procedure Get(I: out Integer; Q: in out Queue) is
  begin
    if Q.Free = 0 then
      raise Underflow;
    end if;
    I := Q.Data(0);
    Q.Free := Q.Free-1;
    Q.Data(0..Q.Free-1) := Q.Data(1..Q.Free);
  end Get;

  Q: Queue(10);                 -- Create queue of size 10
  I: Integer;                   -- Element of the queue
  Test_Data: array(Positive range <>) of Integer :=
    (10, 5, 0, 25, 15, 30, 15, 20, -6, 40);

begin
  for N in Test_Data'Range loop
    Put(Test_Data(N), Width => 5);
    Put(Test_Data(N), Q);
  end loop;
  New_Line;

--  Put(17, Q);  -- Remove comment to test overflow

  while not Empty(Q) loop
    Get(I, Q);
    Put(I, Width => 5);
  end loop;
  New_Line;

  Get(I,Q);  -- Test underflow

exception
  when Underflow => Put_Line("Underflow from queue");
  when Overflow  => Put_Line("Overflow  from queue");
end ProgPQA;
