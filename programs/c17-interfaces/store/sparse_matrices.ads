with Matrices;
with Store;
package Sparse_Matrices is
   type Sparse_Matrix(Rows: Natural; Cols: Natural) is 
     new Matrices.Matrix and Store.Storable with private; 

   -- Override primitive subprograms of Matrix interface
   function Element(M: Sparse_Matrix; X, Y: Natural) return Float;
   procedure Set_Element
     (M: in out Sparse_Matrix; X, Y: in Natural; Value: in Float);
   procedure Zero(M: in out Sparse_Matrix);

   function Rows(M: Sparse_Matrix) return Natural;
   function Cols(M: Sparse_Matrix) return Natural;
   function  "="(M1, M2: Sparse_Matrix) return Boolean;

   -- Override primitive subprograms of Storable interface
   procedure Copy(From: in Sparse_Matrix; To: out Sparse_Matrix);
   function  Default(S: Sparse_Matrix) return Store.Storable'Class;
private
   type Item is record
      Value: Float;
      X:     Integer;  -- -1 for sentinel
      Y:     Integer;
      Next:  access Item;
   end record;

   type Sparse_Matrix(Rows: Natural; Cols: Natural) is 
     new Matrices.Matrix and Store.Storable with 
       record
         Contents: access Item := 
           new Item'(0.0, -1, -1,
           new Item'(0.0, Natural'Last, Natural'Last, null));
       end record;
end Sparse_Matrices;
