generic
  type T is range <>;
  with function Formal(Left, Right: T) return T;
package GP is
  function Func(Left, Right: T) return T;
end GP;

package body GP is
  function Func(Left, Right: T) return T is
  begin
    return 2*(Left+Right);
  end Func; 
end GP;

with GP;
generic
  with package GFP is new GP(<>);
--  with package GFP is new GP(Integer, "+");
procedure Proc;

with Ada.Text_IO; 
procedure Proc is
  package GIO is new Ada.Text_IO.Integer_IO(GFP.T);
begin
  GIO.Put(GFP.Func(1,2));
  GIO.Put(GFP.Formal(1,2));
end Proc;

with GP; with Proc;
procedure Main is
  function Actual(Left, Right: Long_Integer) return Long_Integer is
  begin
    return 4*(Left+Right);
  end Actual; 
  package GP_Instance is new GP(Long_Integer, Actual);
  procedure Proc_Instance is new Proc(GP_Instance);
begin
  Proc_Instance;
end Main;
