
with Event_Package; use Event_Package;
package Event_Queue is

  type Queue is limited private;
  type Queue_Ptr is access Queue;

  function  Empty(Q: in Queue) return Boolean;
  procedure Put(E: in Event'Class; Q: in out Queue);
  function  Get(Q: Queue_Ptr) return Event'Class;

private
--
--  Implement as tree.
-- 
  type Node; 
  type Link is access Node;
  type Queue is
    record
      Root: Link;
    end record;
end Event_Queue;
