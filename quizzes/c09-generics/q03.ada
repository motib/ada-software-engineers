procedure Main is

  generic
    type T(A: Integer) is private;
  procedure Proc;
  procedure Proc is
  begin
    null;
  end Proc;

  type Base(D: Integer) is null record;
  type R(Disc: Integer) is new Base(D => Disc);
  type S is new Base(D => 10);

  procedure Proc1 is new Proc(T => R);
  procedure Proc2 is new Proc(T => S);

begin
  null;
end Main;

