--
-- Instantiation of the signature with array queue
--
with Event_Array_Queue; use Event_Array_Queue;
with Generic_Event_Priority_Queue;
package Event_Queue_2 is new Generic_Event_Priority_Queue(Queue);
