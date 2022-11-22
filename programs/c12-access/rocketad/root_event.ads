--
-- Discrete event simulation of a rocket.
-- Self-referential nodes using access discriminants.
--
package Root_Event is
  type Event is tagged;
  type Event_Ptr is access Event;
  type Node;
  type Link is access all Node;
  type Node(E: access Event'Class) is
    record
      Left, Right: Link;
    end record;
  subtype Simulation_Time is Integer range 0..10_000;
  type Event is abstract tagged limited
    record
      Inner: aliased Node(Event'Access);
      Time: Simulation_Time;
    end record;

  function  Create return Event_Ptr is abstract;
  procedure Simulate(E: in Event) is abstract;
  function "<"(Left, Right: Event'Class) return Boolean;
end Root_Event;
