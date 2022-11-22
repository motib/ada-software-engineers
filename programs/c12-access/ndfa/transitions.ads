limited with States;
package Transitions is

   type Transition is
      record
         From:   access States.State;
         Symbol: Character;
         To:     access States.State;
      end record;

   procedure Debug(T: in Transition);

end Transitions;
