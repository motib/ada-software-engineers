package Root_Event is
  type Event is tagged private;
  function  Create return Event;
  procedure Simulate(E: in Event);
  function Format(D: Event) return String;
  function "<"(Left, Right: Event'Class) return Boolean;
private
  subtype Simulation_Time is Integer range 0..10_000;
  type Event is tagged
    record
      Time: Simulation_Time;
    end record;
end Root_Event;
