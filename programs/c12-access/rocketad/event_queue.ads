
with Root_Event; use Root_Event;
package Event_Queue is

  type Queue is limited private;

  function  Empty(Q: access Queue) return Boolean;
  procedure Put(E: access Event'Class; Q: access Queue);
  function  Get(Q: access Queue) return access Event'Class;

private
  type Queue is
    record
      Root: Link;
    end record;
end Event_Queue;
