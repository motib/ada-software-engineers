with SelectionSort;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure SortAcc is

  type Point is 
    record
      X, Y: Float;
    end record;
  type Point_Link is access Point;

  type  Point_Vector is array(Character range <>) of Point_Link;

  function "<"(Left, Right: Point_Link) return Boolean is
  begin
    return Left.X < Right.X or
           (Left.X = Right.X and then Left.Y < Right.Y);
  end "<";

  procedure Point_Sort is 
    new SelectionSort(Character, Point, Point_Link, Point_Vector);
  A: Point_Vector := 
    (new Point'(10.0,1.0), 
     new Point'(4.0,2.0),
     new Point'(5.0,3.4),
     new Point'(10.0,0.5));
begin
  Point_Sort(A);
  for I in A'Range loop 
    Put(A(I).X,5,2,0); 
    Put(A(I).Y,5,2,0); 
    New_Line;
  end loop;
end SortAcc;
