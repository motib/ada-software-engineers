
package Root_Event.Telemetry is
  type Telemetry_Event is new Event with private;
  type Subsystems is (Engines, Guidance, Communications);
  type States is (OK, Failed);
  function Create(Sub: Subsystems; St: States) return Event_Ptr;
  procedure Simulate(E: in Telemetry_Event);
private
  type Telemetry_Ptr is access all Telemetry_Event;
  type Telemetry_Event is new Event with
    record
      ID:     Subsystems;
      Status: States;
    end record;
end Root_Event.Telemetry;
