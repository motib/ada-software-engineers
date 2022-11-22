package P is
  type T is private;
private
  type Ptr is access T'Class;
  type T is tagged
    record
      Next: Ptr;
    end record;
end P;

