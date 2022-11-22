with Ada.Text_IO; use Ada.Text_IO;
with Root_Event.Rocket_Event.Random_Time;
package body Root_Event.Rocket_Event.Engine is

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

begin
  Random_Time.Reset(G);
end Root_Event.Rocket_Event.Engine;
