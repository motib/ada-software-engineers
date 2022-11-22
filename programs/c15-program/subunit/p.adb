package body P is
  S: String := "Global variable";
  package Inner is
    procedure Proc2;
  end Inner;
  procedure Proc1 is separate;     -- Body stub
  package body Inner is separate; -- Body stub
  -- Body of Inner is illegal here
end P;
