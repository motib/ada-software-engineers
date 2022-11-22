generic
  type Item(<>) is private;
  with function "<"(Left, Right: Item) return Boolean is <>;
package Tree_HPQ is
  type Queue(Size: Positive) is limited private;
  function  Empty(Q: access Queue) return Boolean;
  procedure Put(E: in Item; Q: access Queue);
  function  Get(Q: access Queue) return Item;
  Overflow, Underflow: exception;
private
  type Node;
  type Link is access Node;
  type Queue(Size: Positive) is 
    record
      Root: Link;
    end record;
end Tree_HPQ;
