with Ada.Containers.Indefinite_Ordered_Sets;
with Root_Event;
package Event_Queue is new
  Ada.Containers.Indefinite_Ordered_Sets(
    Root_Event.Event'Class, 
    Root_Event."<",
    Root_Event."=");
