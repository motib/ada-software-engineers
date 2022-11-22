package P is  
  type Parent is tagged null record;
  type Parent_Ptr is access all Parent;
  procedure Proc1(X: Parent_Ptr);
  procedure Proc2(X: access Parent);
  type Derived is new Parent with null record;
  D: aliased Derived;
end P;

with P; use P;
procedure Main is
begin
  Proc1(D'Access);
  Proc2(D'Access);
end Main;

