procedure Main is
  type AV is access Integer;
  type AC is access constant Integer;

  P: AV := new Integer'(1);
  C: AC := new Integer'(2);
begin
  C := AC(P);
  P := AV(C);
end Main;
