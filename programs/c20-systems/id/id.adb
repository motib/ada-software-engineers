--
-- Task identification and attributes.
--
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Task_Identification;
with Ada.Task_Attributes;
with Ada.Numerics.Discrete_Random;
procedure ID is

  package Importance is new Ada.Task_Attributes(Integer, 0);

  task Server is
    entry Request;
    entry Release;
  private
    entry Slow_Release;
  end Server;

  task body Server is
    use Ada.Task_Identification;
    ID1,  ID2:  Task_ID;
    Importance1, Importance2: Integer := 0;

    procedure Print(S: String; T: Task_ID) is
    begin
      Put_Line(S & Image(T) & Integer'Image(Importance.Value(T)));
    end Print;

  begin
    loop
      select
        accept Request do
          if Importance.Value(Request'Caller) > Importance1 then
            Importance2 := Importance1; 
            ID2  := ID1;
            ID1  := Request'Caller;
            Importance1 := Importance.Value(ID1);
          elsif Importance.Value(Request'Caller) > Importance2 then
            ID2  := Request'Caller;
            Importance2 := Importance.Value(ID2);
          end if;
          Print("Request ", Request'Caller);
        end Request;   
      or
        accept Release do
          if Release'Caller /= ID1 and Release'Caller /= ID2 then
            requeue Slow_Release;
          end if;
          Print("Release ", Release'Caller);
        end Release;
      or
        when Release'Count = 0 =>
          accept Slow_Release do
            Print("Slow release ", Slow_Release'Caller);
          end Slow_Release;
      or
        terminate;
      end select; 
    end loop;
  end Server;

  subtype Numbers is Integer range 1..100;
  package Random_Numbers is new Ada.Numerics.Discrete_Random(Numbers);
  G: Random_Numbers.Generator;

  task type Client1;
  task body Client1 is
  begin
    Importance.Set_Value(Random_Numbers.Random(G));
    Server.Request;
    delay 0.5;
    Server.Release;
  end Client1;

  task type Client2;
  task body Client2 is
  begin
    Importance.Set_Value(Random_Numbers.Random(G));
    Server.Request;
    delay 0.5;
    Server.Release;
  end Client2;

  C1: array(1..5) of Client1;
  C2: array(1..5) of Client2;
begin
  null;
end ID;

