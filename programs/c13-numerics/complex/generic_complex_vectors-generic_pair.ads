generic
package Generic_Complex_Vectors.Generic_Pair is
  type Pair is private;
private
  subtype Max is Integer range 0..100;
  type Pair(Size: Max := 10) is
    record
      First, Second: Vector(1..Size);
    end record;
end Generic_Complex_Vectors.Generic_Pair;
