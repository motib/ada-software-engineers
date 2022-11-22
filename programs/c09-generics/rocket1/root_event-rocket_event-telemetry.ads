package Root_Event.Rocket_Event.Telemetry is
  type Telemetry_Event is new Event with private;

  -- Override primitive operations of Event.
  function Create return Telemetry_Event;
  procedure Simulate(E: in Telemetry_Event);
private
  type Subsystems is (Engines, Guidance, Communications);
  type States is (OK, Failed);
  type Telemetry_Event is new Event with 
    record
      ID:     Subsystems;
      Status: States;
    end record;
end Root_Event.Rocket_Event.Telemetry;