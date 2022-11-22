--
-- Discrete event simulation of a rocket.
--
package Root_Event is
--
-- Declaration of abstract event at root of event class.
--
  type Event is abstract tagged private;

  -- Declare (abstract) primitive operations of an Event.
  function  Create return Event is abstract;
  procedure Simulate(E: in Event) is abstract;
  procedure Start(E: in out Event) is null;

  -- Comparison of events is common to all events in the class.
  function "<"(Left, Right: Event'Class) return Boolean;

private

  subtype Simulation_Time is Integer range 0..10_000;
  type Event is abstract tagged
    record
      Time: Simulation_Time;   -- Common component of all events
    end record;

end Root_Event;
