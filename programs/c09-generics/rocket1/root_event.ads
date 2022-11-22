package Root_Event is
  type Event is abstract tagged private;
  function  Create return Event is abstract;
  procedure Simulate(E: in Event) is null;
  function "<"(Left, Right: Event'Class) return Boolean;
private
  subtype Simulation_Time is Integer range 0..10_000;
  type Event is abstract tagged
    record
      Time: Simulation_Time;
    end record;
end Root_Event;
