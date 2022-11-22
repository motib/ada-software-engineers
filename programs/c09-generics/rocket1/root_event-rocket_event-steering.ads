package Root_Event.Rocket_Event.Steering is
  type Steering_Event is new Event with private;

  -- Override primitive operations of Event.
  function Create return Steering_Event;
  procedure Simulate(E: in Steering_Event);
private
  type Commands is (Roll, Pitch, Yaw);
  subtype Degrees is Integer range -90 .. 90;
  type Steering_Event is new Event with 
    record
      Command: Commands;
      Degree: Degrees;
    end record;
end Root_Event.Rocket_Event.Steering;
