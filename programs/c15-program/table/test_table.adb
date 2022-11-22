with Table;
with Ada.Text_IO; use Ada.Text_IO;
procedure Test_Table is
begin
   for I in Table.Translate'Range loop
      Put(Table.Translate(I));
   end loop;
   New_Line;
end Test_Table;
