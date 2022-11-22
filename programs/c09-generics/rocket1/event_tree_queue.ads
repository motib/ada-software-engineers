--
-- Instantiation of event queue implemented by trees
--
with Tree_HPQ;
with Root_Event; use Root_Event;
package Event_Tree_Queue is new Tree_HPQ(Event'Class);
