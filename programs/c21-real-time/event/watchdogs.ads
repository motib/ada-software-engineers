with Ada.Real_Time.Timing_Events;
package Watchdogs is
  protected Watchdog_PO is
    procedure Watchdog_Handler(
      Event: in out Ada.Real_Time.Timing_Events.Timing_Event);
  end Watchdog_PO;
end Watchdogs;
