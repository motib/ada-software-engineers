procedure Main is

  task type T is
    entry E;
  end T;

  task body T is
    procedure P is
    begin
      accept E;
    end P;
  begin
    begin
      accept E do
        accept E;
      end E;
    end;
  end T;

begin
  null;
end Main;

