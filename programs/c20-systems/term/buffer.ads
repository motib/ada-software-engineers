package Buffer is
  type Index is mod 128;
  type Buffer_Array is array(Index) of Integer;

  protected Buffer_Object is
    entry Append(I: in  Integer);
    entry Take  (I: out Integer);
  private
    B: Buffer_Array;
    In_Ptr, Out_Ptr, Count:  Index := 0;
  end Buffer_Object;
end Buffer;