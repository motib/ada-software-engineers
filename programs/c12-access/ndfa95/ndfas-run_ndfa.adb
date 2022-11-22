with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random;
with Ada.Calendar;
with States_Transitions;
package body NDFAs.Run_NDFA is

   -- Run the NDFA A with string Input
   procedure Run(A : access NDFAs.NDFA; Input : in String) is
      Current: States_Transitions.State_Ptr; -- Current state
      Num_Out: Natural;           -- Number of outgoing states
      Gen:     Ada.Numerics.Float_Random.Generator;
      -- Generator for random numbers
   begin
      -- Set random seed from clock
      Ada.Numerics.Float_Random.Reset(
         Gen, Integer(Ada.Calendar.Seconds(Ada.Calendar.Clock)));

      -- Find start state
      for I in 0..A.Num_States-1 loop
         if A.States(I).Is_Start then
            Current := A.States(I)'Access;
            exit;
         end if;
      end loop;
      Put_Line("Running NDFA on """ & Input &
        """ from initial state " & Current.Name);

      -- Loop over input symbols
      for I in Input'Range loop

         -- Count outgoing transitions
         Num_Out := 0;
         for J in 0.. Current.Num_Outgoing-1 loop
            if Current.Outgoing(J).Symbol = Input(I) then
               Num_Out := Num_Out + 1;
            end if;
         end loop;

         Put('(' & Current.Name & ',' & Input(I) & ") by ");

         -- If no transitions, reject input
         if Num_Out = 0 then
            Put_Line("Rejected ... ");
            return;
            -- If more than one transition, choose randomly
         elsif Num_Out > 1 then
            Num_Out := (Integer(Float(Num_Out) *
                Ada.Numerics.Float_Random.Random(Gen))
              mod Num_Out)
              + 1;
         end if;

         -- Perform the transition
         for J in 0.. Current.Num_Outgoing-1 loop
            if Current.Outgoing(J).Symbol = Input(I) then
               -- If more than one, continue searching
               if Num_Out /= 1 then
                  Num_Out := Num_Out - 1;
               else
                  States_Transitions.Debug(Current.Outgoing(J).all);
                  -- Set Current to the target state
                  Current := Current.Outgoing(J).To;
                  Put_Line(" to " & Current.Name);
                  exit;
               end if;
            end if;
         end loop;

         --  Perform_Transition;
      end loop;
      if Current.Is_Final then
         put_Line("Accepted!!");
      end if;
   end Run;

end NDFAs.Run_NDFA;
