with Ada.Text_IO;
package body Watchdogs is
  protected body Watchdog_PO is
    procedure Watchdog_Handler(
      Event: in out Ada.Real_Time.Timing_Events.Timing_Event) is
    begin
      Ada.Text_IO.Put_Line("Too much time - watchdog executed");
    end Watchdog_Handler;
  end Watchdog_PO;
end Watchdogs;
