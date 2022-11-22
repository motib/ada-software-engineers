with Ada.Text_IO; use Ada.Text_IO;
procedure Union is
  type Codes is (M1, M2);
  type Structured_Message(Code: Codes := M1) is
    record
      case Code is
        when M1 => A: Integer;
        when M2 => B: Float;
      end case;
    end record;
  pragma Unchecked_Union(Structured_Message);

  U: Structured_Message(M1) := (M2, 12.34);
begin
  Put_Line(Integer'Image(U.A));
--  Put_Line(Float'Image(U.B));  -- Try compiling this
end Union;
