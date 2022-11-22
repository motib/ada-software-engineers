with Display;
package Root_Event is
  type Event is abstract tagged private;
  function  Create return Event is abstract;
  procedure Simulate(E: in Event) is abstract;
  function "<"(Left, Right: Event'Class) return Boolean;

  type Displayed_Event is abstract
    new Event and Display.Displayable with private;
  -- abstract function Format is inherited
  procedure Set_Size(D: in out Displayed_Event; N: Natural);
  function  Get_Size(D: Displayed_Event) return Natural;
private
  subtype Simulation_Time is Integer range 0..10_000;
  type Event is abstract tagged
    record
      Time: Simulation_Time;
    end record;
  type Displayed_Event is abstract
    new Event and Display.Displayable with
      record
        Size: Natural := 10;
      end record;
end Root_Event;
