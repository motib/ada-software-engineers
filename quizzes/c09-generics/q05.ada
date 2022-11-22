package Q is
  type Parent is null record;
  procedure Proc(A: in Parent);
  type Actual is new Parent;
  procedure Proc(A: in Actual);
end Q;

with Ada.Text_IO; use Ada.Text_IO;
package body Q is
  procedure Proc(A: in Parent) is
  begin
    Put_Line("Parent");
  end Proc;
  procedure Proc(A: in Actual) is
  begin
    Put_Line("Actual");
  end Proc;
end Q;

with Q;
generic
  type Formal is new Q.Parent;
package P is
  type Derived is new Formal;
  procedure Inside;
end P;

package body P is
  procedure Inside is
    D: Derived;
  begin
    Proc(D);
  end Inside;
end P;

with P; with Q;
procedure Main is
  package Instance is new P(Q.Actual);
  D: Instance.Derived;
begin          
  Instance.Inside;
  Instance.Proc(D);
end Main;

