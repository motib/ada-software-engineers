package P is
  type T is array(0..5) of Natural;
end P;

with P;
generic
  with procedure Proc(Parm: in P.T);
package Gen is
  procedure ProcG;
end Gen;

package body Gen is
  type TG is array(0..10) of Natural;
  GG: TG := (0,1,2,3,4,5,6,7,8,9,10);
  procedure ProcG is
  begin
    Proc(P.T(GG));
  end ProcG;
end Gen;

with P, Gen, Ada.Text_IO;
procedure Main is
  procedure M(PP: in P.T) is
  begin
    for I in P.T'Range loop
      Ada.Text_IO.Put(Natural'Image(PP(I)));
    end loop;
  end M;
  package GM is new Gen(Proc => M);
begin
  GM.ProcG;
end Main;
