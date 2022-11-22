--
-- Priority queue implementation by arrays
--
generic
  type Item(<>) is private;
  with function "<"(Left, Right: Item) return Boolean is <>;
package Array_HPQ is 
  type Queue(Size: Positive) is limited private;
  function  Empty(Q: access Queue) return Boolean;
  procedure Put(I: in Item; Q: access Queue);
  function  Get(Q: access Queue) return Item;
  Overflow, Underflow: exception;
private
  type Item_Ptr is access Item;
  type Vector is array(Natural range <>) of Item_Ptr;
  type Queue(Size: Positive) is
    record
      Data: Vector(0..Size);  -- Extra slot for sentinel
      Free: Natural := 0;
    end record;
end Array_HPQ;
