--
-- Discrete event simulation of a rocket.
-- Child packages are not used.
--
package Event_Package is
  subtype Simulation_Time is Integer range 0..10_000;
  type Event is abstract tagged
    record
      Time: Simulation_Time;   -- Common component of all events
    end record;
  function  Create return Event is abstract;
  procedure Simulate(E: in Event) is abstract;
  function "<"(Left, Right: Event'Class) return Boolean;

  type Engine_Event is new Event with 
    record
      Fuel, Oxygen: Natural;
    end record;
  function Create return Engine_Event;
  procedure Simulate(E: in Engine_Event);

  type Main_Engine_Event is new Engine_Event with
    null record;      
  function Create return Main_Engine_Event;
    
  type Aux_Engine_ID is (Left, Right);
  type Aux_Engine_Event is new Engine_Event with 
    record
      Side: Aux_Engine_ID;      
    end record;
  function Create return Aux_Engine_Event;
  procedure Simulate(E: in Aux_Engine_Event);

  type Commands is (Roll, Pitch, Yaw);
  subtype Degrees is Integer range -90 .. 90;
  type Steering_Event is new Event with 
    record
      Command: Commands;
      Degree: Degrees;
    end record;
  function Create return Steering_Event;
  procedure Simulate(E: in Steering_Event);

  type Subsystems is (Engines, Guidance, Communications);
  type States is (OK, Failed);
  type Telemetry_Event is new Event with 
    record
      ID:     Subsystems;
      Status: States;
    end record;
  function Create return Telemetry_Event;
  procedure Simulate(E: in Telemetry_Event);
end Event_Package;
