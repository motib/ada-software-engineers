--
-- Priority queue body implementation by arrays
--
package body Array_HPQ is

  function  Empty(Q: access Queue) return Boolean is
  begin
    return Q.Free = 0;
  end Empty;

  procedure Put(I: in Item; Q: access Queue) is
    Index: Integer range Q.Data'Range := 0;
  begin
    if Q.Free = Q.Size then 
      raise Overflow; 
    end if;

    -- Sentinel search for place to insert
    Q.Data(Q.Free) := new Item'(I);
    while (Q.Data(Index).all < I) loop 
      Index := Index+1; 
    end loop;

    -- Move elements to free space and insert I
    if (Index < Q.Free) then
      Q.Data(Index+1..Q.Free) := Q.Data(Index..Q.Free-1);
      Q.Data(Index) := new Item'(I);
    end if;
    Q.Free := Q.Free+1;
  end Put;

  function  Get(Q: access Queue) return Item is
    I: Item_Ptr;
  begin
    if Q.Free = 0 then 
      raise Underflow; 
    end if;
    I := Q.Data(0);
    Q.Free := Q.Free-1;
    Q.Data(0..Q.Free-1) := Q.Data(1..Q.Free);
    return I.all;
  end Get;  
end Array_HPQ;
