--
-- Discrete event simulation of a rocket.
-- Inherited discriminants.
--
package Event_Package is
  subtype Simulation_Time is Integer range 0..10_000;
  type Event(Number: Positive) is abstract tagged
    record
      Time: Simulation_Time;
      Code: String(1..Number);
    end record;
  function  Create(N: Positive) return Event is abstract;
  procedure Simulate(E: in Event) is abstract;
  function "<"(Left, Right: Event'Class) return Boolean;

  type Engine_Event(Count: Positive; Engines: Positive) is 
     new Event(Number => Count) with 
    record
      Fuel, Oxygen: Natural;
    end record;
  function Create(N: Positive) return Engine_Event;
  procedure Simulate(E: in Engine_Event);

  type Main_Engine_Event is new Engine_Event with
    null record;      
  function Create(N: Positive) return Main_Engine_Event;
    
  type Aux_Engine_ID is (Left, Right);
  type Aux_Engine_Event is new Engine_Event with 
    record
      Side: Aux_Engine_ID;      
    end record;
  function Create(N: Positive) return Aux_Engine_Event;
  procedure Simulate(E: in Aux_Engine_Event);

  type Commands is (Roll, Pitch, Yaw);
  subtype Degrees is Integer range -90 .. 90;
  type Steering_Event is new Event with 
    record
      Command: Commands;
      Degree: Degrees;
    end record;
  function Create(N: Positive) return Steering_Event;
  procedure Simulate(E: in Steering_Event);

  type Subsystems is (Engines, Guidance, Communications);
  type States is (OK, Failed);
  type Telemetry_Event is new Event(Number => 4) with 
    record
      ID:     Subsystems;
      Status: States;
    end record;
  function Create(N: Positive) return Telemetry_Event;
  procedure Simulate(E: in Telemetry_Event);
end Event_Package;
