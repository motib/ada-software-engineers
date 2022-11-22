with Store;
package Event_Package is
  subtype Simulation_Time is Integer range 0..10_000;
  type Event is abstract tagged
    record
      Time: Simulation_Time := 0;
    end record;
  function  Create return Event is abstract;
  procedure Simulate(E: in Event) is abstract;
  function "<"(Left, Right: Event'Class) return Boolean;

  type Storable_Event is abstract new Event and Store.Storable with null record;

  type Engine_Event is new Storable_Event with 
    record
      Fuel, Oxygen: Natural := 0;
    end record;
  function Create return Engine_Event;
  procedure Simulate(E: in Engine_Event);
  function Default(S: Engine_Event) return Store.Storable'Class;
  procedure Copy(From: in Engine_Event; To: out Engine_Event);

  type Main_Engine_Event is new Engine_Event with
    null record;      
  function Create return Main_Engine_Event;
  function Default(S: Main_Engine_Event) return Store.Storable'Class;

  type Aux_Engine_ID is (Left, Right);
  type Aux_Engine_Event is new Engine_Event with 
    record
      Side: Aux_Engine_ID := Left;
    end record;
  function Create return Aux_Engine_Event;
  procedure Simulate(E: in Aux_Engine_Event);
  function Default(S: Aux_Engine_Event) return Store.Storable'Class;
  procedure Copy(From: in Aux_Engine_Event; To: out Aux_Engine_Event);

  type Commands is (Roll, Pitch, Yaw);
  subtype Degrees is Integer range -90 .. 90;
  type Steering_Event is new Storable_Event with 
    record
      Command: Commands := Roll;
      Degree: Degrees := 0;
    end record;
  function Create return Steering_Event;
  procedure Simulate(E: in Steering_Event);
  function Default(S: Steering_Event) return Store.Storable'Class;
  procedure Copy(From: in Steering_Event; To: out Steering_Event);
end Event_Package;
