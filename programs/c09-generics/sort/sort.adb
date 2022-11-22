with Ada.Containers.Generic_Array_Sort;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Sort is
  type Point is 
    record
      X, Y: Float;
    end record;
  type  Point_Vector is array(Character range <>) of Point;

  function "<"(Left, Right: Point) return Boolean is
  begin
    return Left.X < Right.X or 
           (Left.X = Right.X and then Left.Y < Right.Y);
  end "<";

  procedure Point_Sort is new 
    Ada.Containers.Generic_Array_Sort(Character, Point, Point_Vector);

  A: Point_Vector := 
    ((10.0,1.0), (4.0,2.0), (5.0,3.4), (10.0,0.5));
begin
  Point_Sort(A);
  for I in A'Range loop 
    Put(A(I).X,5,2,0); 
    Put(A(I).Y,5,2,0); 
    New_Line;
  end loop;
end Sort;
