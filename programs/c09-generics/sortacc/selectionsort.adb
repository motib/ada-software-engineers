procedure SelectionSort(A: in out Vector) is
  Min:  Index;
  Temp: Item;
begin
  for I in A'First .. Index'Pred(A'Last) loop
      Min := I;
      for J in I .. A'Last loop 
        if A(J) < A(Min) then Min := J; end if;
      end loop;
      Temp := A(I); A(I) := A(Min); A(Min) := Temp;
  end loop;
end SelectionSort;
