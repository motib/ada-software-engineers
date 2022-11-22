--
-- Reads a file in the dot graphics language (http://graphviz.org).
-- Stores the data in a data structure and
--   puts it to a file in a fixed format
--   with nodes, edges and attributes written in order
--
with Ada.Text_IO, Ada.Exceptions, Ada.Command_Line;
with Ada.Strings.Fixed, Ada.Strings.Bounded;
with Config, Lines, Lines_IO, Dot_Tables;
procedure Dot2Dot is

   -- States for recognizer
   type State is
     (Digraph, Name, Open_Brace, Statements, Open_Bracket, Equals, Semicolon,
      Attributes, Values, Pointer, Targets);
   Current_State: State := Digraph;

   -- A statement is a list of attributes or an element (node or edge)
   type Statement is (Attributes, Nodes, Edges);
   Current_Statement: Statement;
   Current_Attribute: Dot_Tables.Attribute;

   -- For edges a -> b, store first node name
   -- For attributes key = vale, store key name
   Current_Name: Config.Name;

   Syntax_Error: exception;

   Table: Dot_Tables.Table;

   --
   -- Pad the string S so that it fits into Config.Name
   --
   function Pad(S: in String) return Config.Name is
   begin
      return Ada.Strings.Fixed.Head(S, Config.Name'Length);
   end Pad;

   procedure State_Machine(N: in Config.Name) is separate;
   procedure Get_Name(
     L: in out Lines.Bounded_String;
     Finish: in out Natural;
     N: out Config.Name) is separate;

   --
   -- Read input and parse
   -- Sort and output data when eof is reached
   --
   procedure Main_Loop(Input, Output: in Ada.Text_IO.File_Type) is
      S: Lines.Bounded_String;
      N: Config.Name;
      Finish: Natural := 0;
   begin
      loop
         S := Lines_IO.Get_Line(Input);
         loop
            Get_Name(S, Finish, N);
            exit when Finish = 0;
            State_Machine(N);
         end loop;
      end loop;
   exception
      when E: Syntax_Error =>
         Ada.Text_IO.Put_Line(
           Ada.Exceptions.Exception_Message(E) & " expected");
         Lines_IO.Put_Line(S);
      when Ada.Text_IO.End_Error =>
         Dot_Tables.Sort(Table);
         Dot_Tables.Put(Table, Output);
   end Main_Loop;

--
-- Main program
--   Get file name from command line
--   Output file name is input file name with "-1" added
--
begin
   if Ada.Command_Line.Argument_Count /= 1 or else
      Ada.Strings.Fixed.Index(Ada.Command_Line.Argument(1), ".") = 0 then
        Ada.Text_IO.Put_Line("Usage: dot2dot file (with extension)");
   else
      -- Block so files and file names are not global
      declare
         use Ada.Text_IO;
         Input_Name: String  := Ada.Command_Line.Argument(1);
         Output_Name: String :=
           Ada.Strings.Fixed.Insert(
           Input_Name, Ada.Strings.Fixed.Index(Input_Name, "."),"-1");
         Input:  File_Type;
         Output: File_Type;
      begin
         Open(Input, In_File, Input_Name);
         Create(Output, Out_File, Output_Name);
         Main_Loop(Input, Output);
         Close(Input);
         Close(Output);
      exception
         when Name_Error => Put_Line("No such file" & Input_Name);
      end;
   end if;
end Dot2Dot;
