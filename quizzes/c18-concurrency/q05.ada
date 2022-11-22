procedure Main is

  task type T;
  type Ptr is access T;

  function F return Ptr is
  begin
    return new T;
  end;

  task body T is
    X: Ptr := F;
    Y: Ptr := new T;
  begin
    null;
  end T;

  Z: Ptr := new T;

begin
  null;
end Main;

