
with Ada.Text_IO; use Ada.Text_IO;
with Root_Event.Random_Time;
package body Root_Event.Telemetry is

  G: Random_Time.Generator;

  function Create return Telemetry_Event_Ptr is
    E: Telemetry_Event_Ptr := new Telemetry_Event;
    use Random_Time;
  begin
    E.Time   := Random(G);
    E.ID     := Subsystems'Val(
        Random(G) mod (Subsystems'Pos(Subsystems'Last)+1));
    E.Status := States'Val(Random(G) mod (States'Pos(States'Last)+1));
    return E;
  end Create;

  procedure Simulate(E: in Telemetry_Event) is
  begin 
    Put("Time " & Integer'Image(E.Time) & ": "); 
    Put_Line("Telemetry message " & 
             Subsystems'Image(E.ID) & " " &
             States'Image(E.Status));
  end Simulate;

begin
  Random_Time.Reset(G);
end Root_Event.Telemetry;
