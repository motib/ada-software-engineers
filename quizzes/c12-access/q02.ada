package P is
  type Ptr is access all Integer;
end P;

with P;
procedure Main is
  N: aliased Integer;
  Q: P.Ptr := N'Access;
begin
  null;
end Main;

