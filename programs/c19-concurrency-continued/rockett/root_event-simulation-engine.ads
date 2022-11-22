package Root_Event.Simulation.Engine is

 type Engine_Event is new Event with private;

  -- Override primitive operations of Event.
  procedure Simulate(E: in Engine_Event);

  type Main_Engine_Event is new Engine_Event with private;
  
  type Aux_Engine_Event is new Engine_Event with private;
  procedure Simulate(E: in Aux_Engine_Event);

private

  type Engine_Event is new Event with 
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

end Root_Event.Simulation.Engine;
