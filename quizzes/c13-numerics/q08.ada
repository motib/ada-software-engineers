procedure Main is
  I: Integer;
begin
  case Integer'Pos(I) is
    when Integer'First..Integer'Last => null;
  end case;
end Main;

