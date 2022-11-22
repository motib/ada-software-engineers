--
-- NDFA example in Ada 95.
-- Both states and transitions are defined in the same package
--   and named access types are used.
-- The only nontrivial change is:
--   In NDFAs.Generate_Transitions, the access parameter N
--   must be explicitly converted to the named access type State_Ptr:
--         if (T(I).From = State_Ptr(N)) then
--
package States_Transitions is

   subtype State_Name is String (1 .. 3);
   type Transition;
   type Transition_Ptr is access all Transition;
   type Transition_Set is array(0..10) of Transition_Ptr;

   type State is record
      Name         : State_Name;
      Is_Start     : Boolean := False;
      Is_Final     : Boolean := False;
      Num_Outgoing : Natural := 0;
      Outgoing     : Transition_Set;
   end record;
   type State_Ptr is access all State;
   
   type Transition is
    record
      From:   State_Ptr;
      Symbol: Character;
      To:     State_Ptr;
    end record;

   procedure Debug(T: in Transition);
   procedure Debug (N : in State);

end States_Transitions;
