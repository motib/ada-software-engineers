limited with Transitions;
package States is
   subtype State_Name is String (1 .. 3);

   type Transition_Set is array(0..10) of access Transitions.Transition;

   type State is record
      Name         : State_Name;
      Is_Start     : Boolean := False;
      Is_Final     : Boolean := False;
      Num_Outgoing : Natural := 0;
      Outgoing     : Transition_Set;
   end record;

   procedure Debug (N : in State);

end States;
