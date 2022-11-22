package body Protected_Buffer is
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
end Protected_Buffer;