generic
  type Event(<>) is tagged private;
  type Queue(Size: Positive) is limited private;
  with function  Empty(Q: access Queue) return Boolean is <>;
  with procedure Put(E: in Event'Class; Q: access Queue) is <>;
  with function Get(Q: access Queue) return Event'Class is <>; 
package Generic_Event_Priority_Queue is end;
