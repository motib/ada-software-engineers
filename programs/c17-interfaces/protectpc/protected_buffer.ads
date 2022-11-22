with Buffer_Interface;
package Protected_Buffer is
  type Index is mod 8;
  type Buffer_Array is array(Index) of Integer;

  protected type Buffer is new Buffer_Interface.Buffer with
    entry Append(I: in  Integer);
    entry Take  (I: out Integer);
  private
    B: Buffer_Array;
    In_Ptr, Out_Ptr, Count:  Index := 0;
  end Buffer;
end Protected_Buffer;