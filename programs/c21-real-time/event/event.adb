with Ada.Text_IO, Ada.Real_Time.Timing_Events;
with Watchdogs;
procedure Event is

  -- As inefficient as possible!
  function Is_Prime(I: in Positive) return Boolean is
  begin
    for K in 2 .. I-1 loop
      if I mod K = 0 then return False; end if;
    end loop;
    return True;
  end Is_Prime;

  Watchdog: Ada.Real_Time.Timing_Events.Timing_Event;
begin
  Ada.Real_Time.Timing_Events.Set_Handler(
    Event => Watchdog,
    In_Time => Ada.Real_Time.Seconds(1),
    Handler => Watchdogs.Watchdog_PO.Watchdog_Handler'Access);
  Ada.Text_IO.Put_Line(Boolean'Image(Is_Prime(179424673)));
end Event;
