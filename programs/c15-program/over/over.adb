procedure Over is

  function F(A: Integer) return Boolean is
  begin
    return False;
  end F;

  function F(A: Integer) return Integer is
  begin
    return 1;
  end F;

  function F(A: Long_Integer) return Boolean is
  begin
    return False;
  end F;

begin
  if F(1) then null; else null; end if;
end Over;

