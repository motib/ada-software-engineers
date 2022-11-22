package P is  
  type Parent is tagged record N: Integer; end record;
  type Derived is new Parent with record M: Integer; end record;
end P;

with P; use P;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
  P: Parent := (N=>1);
  D: Derived := (N=>2, M=>3);
begin
  Parent(D) := P;
  Put(D.N);
  Put(D.M);
end Main;

  
