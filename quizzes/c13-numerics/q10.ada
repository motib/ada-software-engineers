package P is
  type T1 is range 1..100;
  subtype Sub is T1 range 1..50;
  procedure Proc(X: Sub; Y: Sub);
  type T2 is new T1 range 51..100;
end P;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body P is
  procedure Proc(X: Sub; Y: Sub) is
  begin
    Put(Integer(X)); 
    Put(Integer(Y));
  end Proc;
end P;

with P; use P; 
procedure Main is
  Z1: T2 := 88;
  Z2: T2 := 99;
begin
  Proc(Z1, Z2);
end Main;

