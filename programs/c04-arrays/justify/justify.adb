--
-- Read text from a file and write it filled and justified.
--
with Ada.Text_IO; use Ada.Text_IO;
procedure Justify is
  subtype Lines is String(1..80);                -- A line of text
  subtype Index is Integer range 0..Lines'Last;  -- Extra zero value

  -- Constant file name and margins.
  File_Name: constant String := "example.txt";
  Margin:    constant String(1..10) := (others => ' ');

  -- Compute number of characters in printed line.
  Width:     constant Index  := Lines'Length - 2*Margin'Length;

  Input:     File_Type;       -- Input file handle

  procedure Get_Word(         -- Get next word from input
      Word:   out Lines;      -- The next word
      Length: out Index;      -- Its length
      EOF:    out Boolean) is -- True if eof encountered
    C: Character;             -- Character buffer
  begin
    Length := 0;
    EOF := False;
    loop  -- Skip leading ends of line and blanks
      if    End_Of_File(Input) then
        EOF := True;
        return;
      elsif End_Of_Line(Input) then Skip_Line(Input);
      else
        Get(Input, C);
        exit when C /= ' ';
      end if;
    end loop;

    loop  -- Read characters until next space or EOL
      Length := Length + 1;
      Word(Length) := C;
      if Length > Width then -- Truncate word longer than line
        Skip_Line(Input);
        Length := Width;
        return;
      end if;
      exit when End_Of_Line(Input);
      Get(Input, C);
      exit when C = ' ';
    end loop;
  end Get_Word;

  function Insert_Spaces( -- Insert extra spaces in output line
    Line:   Lines;        -- Current output line
    Length: Index;        -- Length of current output line
    Words:  Index)        -- Number of words in line
      return Lines is     -- Return modified line

    Buffer: Lines := (others => ' ');        -- Build new line here
    K1, K2: Index := 1;                      -- Indices for copying line
    L: Index;                                -- Length of word
    Spaces: Natural := Width - Length;       -- Extra spaces
    -- S is number of spaces after each word
    -- Initially, divide extra spaces evenly among words
    S:      array(1..Words) of Natural :=
              (others => (Spaces / (Words-1)) + 1);

  begin
    -- Distribute remaining spaces alternately left and right.
    for N in 1 .. Spaces mod (Words-1) loop
      if Ada.Text_IO.Line mod 2 = 1 then
        S(Words-N) := S(Words-N) + 1;
      else
        S(N) := S(N) + 1;
      end if;
    end loop;
    S(Words) := 0;                       -- Zero spaces after last word

    for W in 1..Words loop
      L := 1;
      while Line(K1+L) /= ' ' loop       -- Search for end of word
        L := L + 1;
      end loop;
      Buffer(K2 .. K2+L + S(W)) :=       -- Move word and extra spaces
        Line(K1 .. K1+L) & (1..S(W) => ' ');
      K1 := K1 + L + 1;
      K2 := K2 + L + S(W);
    end loop;
    return Buffer;
  end Insert_Spaces;

  procedure Put_Word(               -- Put word input output line
    Word:        in Lines;          -- The word to insert
    Word_Length: in Index;          -- Its length
    Words:       in out Index;      -- Current number of words
    Line:        in out Lines;      -- Output line buffer
    Position:    in out Index) is   -- Position to insert word
  begin
    -- Note that Position points past the trailing space
    -- Print full line
    if Position - 1 + Word_Length > Width then
      if Words >= 2 then
        -- Make sure there are at least two words for inserting spaces
        Line := Insert_Spaces(Line, Position-2, Words);
      end if;
      Put_Line(Margin & Line(1..Width));
      Line := (others => ' ');
      Position := 1;
      Words := 0;
    end if;

    -- Append word to line and update counters
    Line(Position..Position+Word_Length) := Word(1..Word_Length) & ' ';
    Position   := Position + Word_Length + 1;
    Words := Words + 1;
  end Put_Word;

  procedure Main_Loop is
    Word:        Lines;                     -- Word buffer
    Word_Length: Index;                     -- Its length
    EOF:         Boolean;                   -- True if EOF encountered
    Buffer:      Lines := (others => ' ');  -- Output line buffer
    Position:    Index := 1;                -- Next position to insert
    Word_Count:  Index := 0;                -- Number of words
  begin
    loop
      Get_Word(Word, Word_Length, EOF);
      exit when EOF;
      Put_Word(Word, Word_Length, Word_Count, Buffer, Position);
    end loop;
    Put_Line(Margin & Buffer(1 .. Position-1));  -- Flush last line
  end Main_Loop;

begin
  Open(Input, In_File, File_Name);
  Main_Loop;
  Close(Input);
exception
   when Name_Error =>
      Put_Line("File " & File_Name & " not found");
end Justify;

