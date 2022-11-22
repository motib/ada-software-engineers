
generic
  type Item(<>) is private;
  with function "<"(Left, Right: Item) return Boolean is <>;
package Priority_Queue is
  type Queue is limited private;

  function  Empty(Q: in Queue) return Boolean;
  procedure Put(E: in Item; Q: in out Queue);
  function  Get(Q: access Queue) return Item;

private
  type Node; 
  type Link is access Node;
  type Queue is
    record
      Root: Link;
    end record;
end Priority_Queue;
