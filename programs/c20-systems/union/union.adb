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

  S1: Structured_Message := (M1, 44);
  S2: Structured_Message := (M2, 12.34);
  
  T1: Structured_Message(M1) := (M1, 44);
  T2: Structured_Message(M2) := (M2, 12.34);
  
begin
  Put_Line(Integer'Image(S1.A));
  Put_Line(Float'Image(S1.B));
  Put_Line(Integer'Image(S2.A));
  Put_Line(Float'Image(S2.B));

  Put_Line(Integer'Image(T1.A));
  Put_Line(Float'Image(T1.B));
  Put_Line(Integer'Image(T2.A));
  Put_Line(Float'Image(T2.B));
end Union;
