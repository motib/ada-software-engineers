with Priority_Queue;
with Root_Event.Engine;
with Displayed_Event; 
use Root_Event;
procedure Mixin2 is
  package Event_Queue is new Priority_Queue(Event'Class);
  Q: aliased Event_Queue.Queue;
begin
  for I in 1..5 loop
    declare
      M: Engine.Main_Engine_Event := Engine.Create;
      A: Engine.Aux_Engine_Event  := Engine.Create;
    begin
      Displayed_Event.Set_Size(Displayed_Event.Displayed_Item(M), 200+I);
      Event_Queue.Put(M, Q);
      Displayed_Event.Set_Size(Displayed_Event.Displayed_Item(A), 100+I);
      Event_Queue.Put(A, Q);
    end;
  end loop;

  while not Event_Queue.Empty(Q) loop
    declare
      EC: Event'Class := Event_Queue.Get(Q'Access);
    begin
      Root_Event.Simulate(EC);
      Displayed_Event.Display_Item(
          Displayed_Event.Displayed_Item(EC));
    end;
  end loop;
end Mixin2;
