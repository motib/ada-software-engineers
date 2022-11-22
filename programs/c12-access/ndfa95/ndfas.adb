with Ada.Text_IO; use Ada.Text_IO;
package body NDFAs is

   -- Insert a state in the NDFA; outgoing transitions are null
   procedure Insert_State
     (A : access NDFA; N : in States_Transitions.State_Name; S, F : in Boolean) is
   begin
      A.States (A.Num_States) := (N, S, F, 0, (others => null));
      A.Num_States := A.Num_States + 1;
   end Insert_State;

   -- Insert a transition in the NDFA
   --   States are given as indices in array of states
   procedure Insert_Transition
     (A : access NDFA; F : in Integer; S : in Character; T : in Integer) is
   begin
      A.Transitions (A.Num_Transitions) :=
        (A.States (F)'Access, S, A.States (T)'Access);
      A.Num_Transitions := A.Num_Transitions + 1;
   end Insert_Transition;

   -- Generate outgoing transitions at a state N
   --   using the data in T
   procedure Generate_Transitions
     (N : access States_Transitions.State; T : access Transition_Array) is
        use States_Transitions;
--        use type States_Transitions.State_Pointer;
   begin
      for I in  T'Range loop
         -- if (T(I).From = N) then
         if (T(I).From = State_Ptr(N)) then
            N.Outgoing(N.Num_Outgoing) := T(I)'Access;
            N.Num_Outgoing := N.Num_Outgoing + 1;
         end if;
      end loop;
   end Generate_Transitions;

   -- Generate outgoing transitions at all states
   procedure Generate_Transitions_At_States (A : access NDFA) is
   begin
      for I in  0 .. A.Num_States - 1 loop
         Generate_Transitions(A.States (I)'Access, A.Transitions'Access);
      end loop;
   end Generate_Transitions_At_States;

   procedure Debug (A : in NDFA) is
   begin
      Put_Line("States:");
      for I in  0 .. A.Num_States - 1 loop
         States_Transitions.Debug (A.States (I));
      end loop;
      New_Line;
      Put_Line("Transitions:");
      for I in  0 .. A.Num_Transitions - 1 loop
         States_Transitions.Debug (A.Transitions (I));
         New_Line;
      end loop;
      New_Line;
   end Debug;

end NDFAs;
