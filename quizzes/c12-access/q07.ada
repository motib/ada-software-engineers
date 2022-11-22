package P is
  type Rec(D: access Integer) is limited null record;
  type Ptr is access Rec;
end P;

with P; use P;
procedure Main is
  N: aliased Integer;
  R: Ptr := new Rec(N'Access);
begin
  null;
end Main;

