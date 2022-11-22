--
-- Producer-consumer using protected object.
--
with Ada.Text_IO; use Ada.Text_IO;
procedure ProtectPC is
  type Index is mod 8;
  type Buffer_Array is array(Index) of Integer;

  protected Buffer is
    entry Append(I: in  Integer);
    entry Take  (I: out Integer);
  private
    B: Buffer_Array;
    In_Ptr, Out_Ptr, Count:  Index := 0;
  end Buffer;
     
  protected body Buffer is
    entry Append(I: in  Integer) when Count < Index'Last is
    begin
      B(In_Ptr) := I;
      Count := Count + 1;
      In_Ptr := In_Ptr + 1;
    end Append;

    entry Take(I: out Integer) when Count > 0 is
    begin
      I := B(Out_Ptr);
      Count := Count - 1;
      Out_Ptr := Out_Ptr + 1;
    end Take;
  end Buffer;

  task Producer;
  task body Producer is
  begin
    for N in 1..200 loop
      Put_Line("Producing " & Integer'Image(N));
      Buffer.Append(N);
    end loop;
  end Producer;

  task type Consumer(ID: Integer);
  task body Consumer is
    N: Integer;
  begin
    loop
      Buffer.Take(N);
      Put_Line(Integer'Image(ID) & " consuming " & Integer'Image(N));
    end loop;
  end Consumer;

  C1: Consumer(1);
  C2: Consumer(2);

begin
  null;
end ProtectPC;
