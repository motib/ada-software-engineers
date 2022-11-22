with States_Transitions;
package NDFAs is

   type NDFA is limited private;

   procedure Insert_State
     (A    : access NDFA;
      N    : in States_Transitions.State_Name;
      S, F : in Boolean);

   procedure Insert_Transition
     (A : access NDFA;
      F : in Integer;
      S : in Character;
      T : in Integer);

   procedure Generate_Transitions_At_States(A : access NDFA);

   procedure Debug(A : in NDFA);

private

   type State_Array is array (0..20) of aliased States_Transitions.State;
   type Transition_Array is array(0..50) of aliased States_Transitions.Transition;

   type NDFA is record
      Num_States       : Natural := 0;
      States           : State_Array;
      Num_Transitions : Natural := 0;
      Transitions     : aliased Transition_Array;
   end record;

end NDFAs;
