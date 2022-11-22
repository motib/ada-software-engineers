package P is
  type Node;
  type Ptr is access Node;
end P;

package body P is
  type Node is
    record
      Key: Integer;
      Next: Ptr;
    end record;
end P;
