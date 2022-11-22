with Transitions;
with Ada.Text_IO; use Ada.Text_IO;
package body States is

   procedure Debug (N : in State) is
   begin
      Put (N.Name);
      if N.Is_Start then Put(" Start "); end if;
      if N.Is_Final then Put(" Final "); end if;
      New_Line;
      if N.Num_Outgoing > 0 then
        Put_Line("   Outgoing: ");
        for I in  0 .. N.Num_Outgoing-1 loop
           Put("   ");
           Transitions.Debug (N.Outgoing(I).all);
           New_Line;
         end loop;
      end if;
   end Debug;

end States;
