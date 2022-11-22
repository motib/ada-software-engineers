
package Root_Event.Engine is
  type Engine_Event is new Event with private;
  function Create(F, O: Natural) return Event_Ptr;
  procedure Simulate(E: in Engine_Event);
private
  type Engine_Ptr is access all Engine_Event;
  type Engine_Event is new Event with
    record
      Fuel, Oxygen: Natural;
    end record;
end Root_Event.Engine;
