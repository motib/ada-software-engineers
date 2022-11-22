--
-- Discrete event simulation of a rocket.
-- Creation of events concurrently with simulation.
--
package Root_Event is

  -- Abstract event at root of event class
  type Event is abstract tagged private;

  -- Declare (abstract) primitive operations of an Event
  procedure Simulate(E: in Event) is abstract;

  -- Comparison of events is common to all events in the class
  function "<"(Left, Right: Event'Class) return Boolean;

private

  subtype Simulation_Time is Natural;
  subtype Simulation_Interval is Simulation_Time range 0..100;
  type Event is abstract tagged
    record
      Time: Simulation_Time;   -- Common field of all events
    end record;

end Root_Event;
