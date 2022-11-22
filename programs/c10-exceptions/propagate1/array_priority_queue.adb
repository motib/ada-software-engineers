package body Array_Priority_Queue is
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

    Q.Data(Q.Free) := I;
    while (Q.Data(Index) < I) loop
      Index := Index+1;
    end loop;

    if (Index < Q.Free) then
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
end Array_Priority_Queue;
