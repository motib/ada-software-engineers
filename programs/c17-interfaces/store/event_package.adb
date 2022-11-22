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

  -- Engine_Event
  function Create return Engine_Event is
  begin
    return (Time =>   Random_Time.Random(G), 
            Fuel =>   Random_Time.Random(G) mod 100, 
            Oxygen => Random_Time.Random(G) mod 500);
  end Create;

  function Default(S: Engine_Event) return Store.Storable'Class is
  begin
    return Store.Storable'Class(Engine_Event'(others => <>));
  end Default;

  procedure Copy(From: in Engine_Event; To: out Engine_Event) is
  begin
    To := From;
  end Copy;

  procedure Put_Data(
    E: Engine_Event; Engine_ID: String; Thrust: Integer) is
  begin
    Put("Time " & Integer'Image(E.Time) & ": "); 
    Put(Engine_ID);
    Put_Line(" engine fuel " & Integer'Image(E.Fuel) &
             " L, oxygen " & Integer'Image(E.Oxygen) &
             " L, produced " & Integer'Image(Thrust) &
             " KG thrust");
  end Put_Data;
  
  procedure Simulate(E: in Engine_Event) is
  begin 
    Put_Data(E, "Main", E.Fuel * E.Oxygen);
  end Simulate;

  -- Main_Engine_Event
  function Create return Main_Engine_Event is
  begin
    return Main_Engine_Event'(Engine_Event'(Create) with null record);
  end Create;

  function Default(S: Main_Engine_Event) return Store.Storable'Class is
  begin
    return Store.Storable'Class(Main_Engine_Event'(others => <>));
  end Default;

  -- Aux_Engine_Event
  function Create return Aux_Engine_Event is
  begin
    return (Engine_Event'(Create) with 
      Aux_Engine_ID'Val(Random_Time.Random(G) mod 2));
  end Create;

  procedure Simulate(E: in Aux_Engine_Event) is
  begin 
    Put_Data(Engine_Event(E), 
             Aux_Engine_ID'Image(E.Side), 
             E.Fuel * E.Oxygen / 2);
  end Simulate;

  function Default(S: Aux_Engine_Event) return Store.Storable'Class is
  begin
    return Store.Storable'Class(Aux_Engine_Event'(others => <>));
  end Default;

  procedure Copy(From: in Aux_Engine_Event; To: out Aux_Engine_Event) is
  begin
    To := From;
  end Copy;

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

  function Default(S: Steering_Event) return Store.Storable'Class is
  begin
    return Store.Storable'Class(Steering_Event'(others => <>));
  end Default;

  procedure Copy(From: in Steering_Event; To: out Steering_Event) is
  begin
    To := From;
  end Copy;
begin
  Random_Time.Reset(G);
end Event_Package;
