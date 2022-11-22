package P is
  type T is tagged null record;
  procedure Proc(X: T);
end P;

with Ada.Text_IO; use Ada.Text_IO;
package body P is
  procedure Proc(X: T) is
  begin 
    Put_Line("Parent"); 
  end Proc;
end P;

with P; use P;
package Q is
  type T1 is new T with null record;
private
  procedure Proc(X: T1);
end Q;

with Ada.Text_IO; use Ada.Text_IO;
package body Q is
  procedure Proc(X: T1) is
  begin 
    Put_Line("Derived"); 
  end Proc;
end Q;

with Q; use Q; 
procedure Main is
  A: T1;
begin
  Proc(A);
end Main;

