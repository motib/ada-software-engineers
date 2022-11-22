--
-- Generic procedure for selection sort.
--
generic
  type Index  is (<>);
  type Node   is private;
  type Item   is access Node;
  type Vector is array(Index range <>) of Item;
  with function "<"(Left, Right: Item) return Boolean is <>;
procedure SelectionSort(A: in out Vector);
