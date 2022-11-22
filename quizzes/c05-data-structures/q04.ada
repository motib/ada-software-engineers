with Ada.Text_IO; 
procedure Main is

  procedure Proc(Stop: Character) is
    Start:  constant Character := 'A';
    type R(C: Character) is
      record
        case C is
          when Start .. Character'Succ(Start) => I: Integer;
          when Stop   => B: Boolean;
          when others => F: Float;
        end case;
      end record;
  begin
    null;
  end Proc;

begin
  null;
end Main;

