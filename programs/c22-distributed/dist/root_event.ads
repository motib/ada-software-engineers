--
-- Distributed dispatching.
--
package Root_Event is
  pragma Remote_Types;
  type Event is abstract tagged limited private;
  type Event_Ptr is access all Event'Class;
  procedure Simulate(E: in Event) is abstract;
private
  type Event is abstract tagged limited null record;
end Root_Event;
