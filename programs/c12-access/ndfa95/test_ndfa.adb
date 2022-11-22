with NDFAs.Run_NDFA;
use NDFAs;
procedure Test_NDFA is
   A : aliased NDFA;
begin
   Insert_State(A'Access, "q0 ", True, False);
   Insert_State(A'Access, "q1 ", False, False);
   Insert_State(A'Access, "q2 ", False, False);
   Insert_State(A'Access, "q3 ", False, True);

   Insert_Transition (A'Access, 0, 'a', 1);
   Insert_Transition (A'Access, 0, 'a', 2);
   Insert_Transition (A'Access, 1, 'a', 1);
   Insert_Transition (A'Access, 1, 'a', 2);
   Insert_Transition (A'Access, 1, 'b', 3);
   Insert_Transition (A'Access, 2, 'b', 3);

   Generate_Transitions_At_States(A'Access);

   Debug(A);

   Run_NDFA.Run (A'Access, "aab");
end Test_NDFA;
