package Root_Event.Engine is

  type Engine_Event is new Event with private;

  -- Override primitive operations of Event.
  overriding
  function Create return Engine_Event;
  overriding
  procedure Simulate(E: in Engine_Event);
  overriding
  procedure Start(E: in out Engine_Event);

  type Main_Engine_Event is new Engine_Event with private;
  overriding
  function Create return Main_Engine_Event;
  
  type Aux_Engine_Event is new Engine_Event with private;
  overriding
  function Create return Aux_Engine_Event;
  overriding
  procedure Simulate(E: in Aux_Engine_Event);
  --not overriding
  --procedure Simulates(E: in Aux_Engine_Event);

private

  type Engine_Event is new Event with 
    record
      Fuel, Oxygen: Natural;
      On: Boolean := False;
    end record;

  type Main_Engine_Event is new Engine_Event with
    null record;      
    
  type Aux_Engine_ID is (Left, Right);
  
  type Aux_Engine_Event is new Engine_Event with 
    record
      Side: Aux_Engine_ID;      
    end record;

end Root_Event.Engine;
