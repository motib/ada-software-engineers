
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

  function Create(N: Positive) return Engine_Event is
  begin
    return (Count   => N, 
            Engines => N mod 2 + 1,
            Code => (1..N => Character'Val(N+96)),
            Time =>   Random_Time.Random(G), 
            Fuel =>   Random_Time.Random(G) mod 100, 
            Oxygen => Random_Time.Random(G) mod 500);
  end Create;

  function Create(N: Positive) return Main_Engine_Event is
  begin
    return Main_Engine_Event'(Engine_Event'(Create(N)) with null record);
  end Create;
  
  function Create(N: Positive) return Aux_Engine_Event is
  begin
    return (Engine_Event'(Create(N)) with 
      Aux_Engine_ID'Val(Random_Time.Random(G) mod 2));
  end Create;

  procedure Put_Data(
    E: Engine_Event; Engine_ID: String; Thrust: Integer) is
  begin
    Put("Time " & Integer'Image(E.Time) & ": "); 
    Put("Code " & E.Code & ", ");
    Put(Engine_ID);
    Put_Line(" engine fuel " & Integer'Image(E.Fuel) &
             " L, oxygen " & Integer'Image(E.Oxygen) &
             " L, produced " & Integer'Image(Thrust) &
             " KG thrust");
  end;
  
  procedure Simulate(E: in Engine_Event) is
  begin 
    for N in 1..E.Count loop
      Put_Data(E, "Main " & Integer'Image(E.Engines), E.Fuel * E.Oxygen);
    end loop;
  end Simulate;

  procedure Simulate(E: in Aux_Engine_Event) is
  begin 
    for N in 1..E.Count loop
      Put_Data(Engine_Event(E), 
             Aux_Engine_ID'Image(E.Side), 
             E.Fuel * E.Oxygen / 2);
    end loop;
  end Simulate;

  function Create(N: Positive) return Steering_Event is
    use Random_Time;
  begin
    return (
      Number => N, 
      Code => (1..N => Character'Val(N+96)),
      Time    => Random(G), 
      Command => Commands'Val(
        Random(G) mod (Commands'Pos(Commands'Last)+1)),
      Degree  => (Random(G) mod 181) - 90
      );
  end Create;

  procedure Simulate(E: in Steering_Event) is
  begin 
    for N in 1..E.Number loop
      Put("Time " & Integer'Image(E.Time) & ": ");
      Put("Code " & E.Code & ", ");
      Put_Line("Steering command " &
             Commands'Image(E.Command) & " to " &
             Integer'Image(E.Degree) & " degrees");
    end loop;
  end Simulate;

  function Create(N: Positive) return Telemetry_Event is
    use Random_Time;
  begin
  return (
      Number => 4,
      Code => (1..4 => Character'Val(N+96)),
      Time   => Random(G), 
      ID     => Subsystems'Val(
        Random(G) mod (Subsystems'Pos(Subsystems'Last)+1)),
      Status => States'Val(Random(G) mod (States'Pos(States'Last)+1))
      );
  end Create;

  procedure Simulate(E: in Telemetry_Event) is
  begin 
    for N in 1..E.Number loop
      Put("Time " & Integer'Image(E.Time) & ": "); 
      Put("Code " & E.Code & ", ");
      Put_Line("Telemetry message " & 
             Subsystems'Image(E.ID) & " " &
             States'Image(E.Status));
    end loop;
  end Simulate;

begin
  Random_Time.Reset(G);
end Event_Package;
