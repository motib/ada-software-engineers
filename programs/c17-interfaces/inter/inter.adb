with Priority_Queue; with Root_Event.Engine;
use Root_Event;
with Display;
procedure Inter is
  package Event_Queue is new Priority_Queue(Event'Class);
  Q: aliased Event_Queue.Queue;
begin
  for I in 1..5 loop
    declare
      M: Engine.Main_Engine_Event := Engine.Main_Engine_Event'(Engine.Create);
      A: Engine.Aux_Engine_Event  := Engine.Aux_Engine_Event'(Engine.Create);
    begin
      Set_Size(Displayed_Event(M), 100+I);
      Event_Queue.Put(M, Q);
      Set_Size(Displayed_Event(A), 200+I);
      Event_Queue.Put(A, Q);
    end;
  end loop;

  while not Event_Queue.Empty(Q) loop
    declare
      EC: Event'Class := Event_Queue.Get(Q'Access);
    begin
      Root_Event.Simulate(EC);
      Display.Display_Item(Display.Displayable'Class(EC));
    end;
  end loop;
end Inter;
