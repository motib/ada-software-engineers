generic
  type Item(<>) is private;
  with function "<"(Left, Right: Item) return Boolean is <>;
package Heterogeneous_Priority_Queue is

  type Queue is limited private;

  procedure Put(E: in Item; Q: in out Queue);
  function  Get(Q: access Queue) return Item;

private
  type Node; 
  type Link is access Node;

  -- Synchronized access to the queue
  -- Block the consumer if the queue is empty
  protected type Lock is
    procedure Put(E: in Item; Q: in out Queue);
    entry Get(Q: access Queue; Found: out Link);
  private
    Empty: Boolean := True;
  end Lock;
  
  type Queue is
    limited record
      L:    Lock;
      Root: Link;
    end record;
end Heterogeneous_Priority_Queue;
