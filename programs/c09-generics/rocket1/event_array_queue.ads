--
-- Instantiation of event queue implemented by arrays
--
with Array_HPQ;
with Root_Event; use Root_Event;
package Event_Array_Queue is new Array_HPQ(Event'Class);
