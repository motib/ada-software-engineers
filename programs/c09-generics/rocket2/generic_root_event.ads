generic
  type Event(<>) is tagged private;
  with function  Create return Event is abstract <>;
  with procedure Simulate(E: in Event) is abstract <>;
  with function "<"(Left, Right: Event'Class) return Boolean is <>;
package Generic_Root_Event is end;