procedure Main is
  function F return Natural is
  begin
    return 4;
  end F;
  pragma Priority(F);

  task T is
    pragma Priority(F);
  end T;
  task body T is
  begin
    null;
  end;
begin
  null;
end Main;
