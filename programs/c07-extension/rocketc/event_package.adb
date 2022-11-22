
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
package body Event_Package is

  package Random_Time is
    new Ada.Numerics.Discrete_Random(Simulation_Time);

  function "<"(Left, Right: Event'Class) return Boolean is
  begin
    return Left.Time < Right.Time;
  end "<";

  G: Random_Time.Generator;

  function Create return Engine_Event is
  begin
    return (Time =>   Random_Time.Random(G), 
            Fuel =>   Random_Time.Random(G) mod 100, 
            Oxygen => Random_Time.Random(G) mod 500);
  end Create;

  function Create return Main_Engine_Event is
  begin
    return Main_Engine_Event'(Engine_Event'(Create) with null record);
  end Create;
  
  function Create return Aux_Engine_Event is
  begin
    return (Engine_Event'(Create) with 
      Aux_Engine_ID'Val(Random_Time.Random(G) mod 2));
  end Create;

  procedure Put_Data(
    E: Engine_Event; Engine_ID: String; Thrust: Integer) is
  begin
    Put("Time " & Integer'Image(E.Time) & ": "); 
    Put(Engine_ID);
    Put_Line(" engine fuel " & Integer'Image(E.Fuel) &
             " L, oxygen " & Integer'Image(E.Oxygen) &
             " L, produced " & Integer'Image(Thrust) &
             " KG thrust");
  end;
  
  procedure Simulate(E: in Engine_Event) is
  begin 
    Put_Data(E, "Main", E.Fuel * E.Oxygen);
  end Simulate;

  procedure Simulate(E: in Aux_Engine_Event) is
  begin 
    Put_Data(Engine_Event(E), 
             Aux_Engine_ID'Image(E.Side), 
             E.Fuel * E.Oxygen / 2);
  end Simulate;

  function Create return Steering_Event is
    use Random_Time;
  begin
    return (
      Time    => Random(G), 
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

  function Create return Telemetry_Event is
    use Random_Time;
  begin
    return (
      Time   => Random(G), 
      ID     => Subsystems'Val(
        Random(G) mod (Subsystems'Pos(Subsystems'Last)+1)),
      Status => States'Val(Random(G) mod (States'Pos(States'Last)+1))
      );
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
end Event_Package;
