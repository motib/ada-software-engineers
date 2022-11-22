package Root_Event.Engine is

  type Engine_Event is new Displayed_Event with private;
  function  Format(D: Engine_Event) return String;

  -- Override primitive operations of Event.
  function Create return Engine_Event;
  procedure Simulate(E: in Engine_Event);

  type Main_Engine_Event is new Engine_Event with private;
  function Create return Main_Engine_Event;
  
  type Aux_Engine_Event is new Engine_Event with private;
  function Create return Aux_Engine_Event;
  procedure Simulate(E: in Aux_Engine_Event);
private
  type Engine_Event is new Displayed_Event with 
    record
      Fuel, Oxygen: Natural;
    end record;

  type Main_Engine_Event is new Engine_Event with
    null record;      
    
  type Aux_Engine_ID is (Left, Right);
  
  type Aux_Engine_Event is new Engine_Event with 
    record
      Side: Aux_Engine_ID;      
    end record;

end Root_Event.Engine;
