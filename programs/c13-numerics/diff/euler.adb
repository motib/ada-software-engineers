procedure Euler(
  F: in Function_Ptr; Init, H: in Float_Type; Result: out Vector) is
begin
  Result(Result'First) := Init;
  for N in Result'First+1..Result'Last loop
    Result(N) := Result(N-1) + H * F(Result(N-1));
  end loop;
end Euler;
