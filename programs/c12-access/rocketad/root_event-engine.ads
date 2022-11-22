
package Root_Event.Engine is

  type Engine_Event is new Event with private;
  type Engine_Event_Ptr is access Engine_Event;

  -- Override primitive operations of Event.
  function Create return Engine_Event_Ptr;
  procedure Simulate(E: in Engine_Event);

  type Main_Engine_Event is new Engine_Event with private;
  type Main_Engine_Event_Ptr is access Main_Engine_Event;
  function Create return Main_Engine_Event_Ptr;
  
  type Aux_Engine_Event is new Engine_Event with private;
  type Aux_Engine_Event_Ptr is access Aux_Engine_Event;
  function Create return Aux_Engine_Event_Ptr;
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

end Root_Event.Engine;
