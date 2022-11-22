package body Priority_Queue is

  type Vector is array(Natural range <>) of Integer;
  type Queue(Size: Positive) is
    record
      Data: Vector(0..Size);  -- Extra slot for sentinel
      Free: Natural := 0;
    end record;

  Q: Queue(100);

  function  Empty return Boolean is
  begin
    return Q.Free = 0;
  end Empty;

  procedure Put(I: in Integer) is
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

  procedure Get(I: out Integer) is
  begin
    if Q.Free = 0 then
      raise Underflow;
    end if;
    I := Q.Data(0);
    Q.Free := Q.Free-1;
    Q.Data(0..Q.Free-1) := Q.Data(1..Q.Free);
  end Get;

end Priority_Queue;
