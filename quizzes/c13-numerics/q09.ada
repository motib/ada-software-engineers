package P is
  type T1 is range 1..100;
  procedure Proc(X: T1; Y: T1);
  type T2 is new T1 range 1..50;
end P;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body P is
  procedure Proc(X: T1; Y: T1) is
  begin
    Put(Integer(X)); 
    Put(Integer(Y));
  end Proc;
end P;

with P; use P; 
procedure Main is
  Z: T2 := 10;
begin
  Proc(Z, 99);
end Main;

