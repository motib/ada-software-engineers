with Ada.Characters.Latin_1, Ada.Characters.Handling, Ada.Strings.Maps.Constants;
separate (dot2dot)
procedure Get_Name(
  L: in out Lines.Bounded_String; -- Input line
  Finish: in out Natural;        -- End of previous name,
                                 --   return end of this name
  N: out Config.Name) is         -- Return this name
  -- Maps for parsing
  -- If use Ada.Strings.Maps is not used, remember "use type" for "or"
  use Lines, Ada.Strings.Maps;
  -- Spaces include tabs and optional comments
  Space_Set: constant Character_Set :=
    To_Set(" ," & Ada.Characters.Latin_1.HT);
  -- Words can include signed integer and decimal numbers
  Word_Set:  constant Character_Set :=
    Constants.Alphanumeric_Set or To_Set("._");
  Punc_Set:  constant Character_Set :=
    To_Set("{}[];=");
  First: Positive;   -- For call of Find_Token
begin
  -- Get remaining input and trim spaces, tabs, commas
  Bounded_Slice(L, L, Finish+1, Length(L));
  Trim(L, Space_Set, Space_Set);
  Finish := 0;
  -- End of line, do nothing
  if Length(L) = 0 then
    return;
  -- One char of punctuation
  elsif Is_In(Element(L, 1), Punc_Set) then
    N := Pad(Slice(L, 1, 1));
    Finish := 1;
  -- Edge pointer symbol
  elsif Slice(L, 1, 2) = "->" then
    N := Pad(Slice(L, 1, 2));
    Finish := 2;
  -- Quoted name or attribute value
  elsif Element(L, 1) = '"' then
    Finish := Index(L, """", 2);
  -- Reserved word, element name, or attribute name or value
  elsif Is_In(Element(L, 1), Word_Set) then
    Find_Token(L, Word_Set, Ada.Strings.Inside, First, Finish);
    if Finish = 0 then return; end if;
  else
    return;
  end if;
  Ada.Strings.Fixed.Move(Slice(L, 1, Finish), N);
end Get_Name;

