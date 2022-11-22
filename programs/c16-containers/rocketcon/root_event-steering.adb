with Ada.Text_IO; use Ada.Text_IO;
with Root_Event.Random_Time;
package body Root_Event.Steering is

  G: Random_Time.Generator;

  function Create return Steering_Event is
    use Random_Time;
  begin
    return (
        Time    => Random(G), 
        Number  => Get_Number,
        Command => Commands'Val(
        Random(G) mod (Commands'Pos(Commands'Last)+1)),
        Degree  => (Random(G) mod 181) - 90
      );
  end Create;

  procedure Simulate(E: in Steering_Event) is
  begin 
    Put("Time " & Integer'Image(E.Time) & ": "); 
    Put_Line("Steering command " &
             Commands'Image(E.Command) & " to " &
             Integer'Image(E.Degree) & " degrees");
  end Simulate;

begin
  Random_Time.Reset(G);
end Root_Event.Steering;
