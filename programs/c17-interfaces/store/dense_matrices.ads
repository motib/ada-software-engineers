with Matrices;
with Store;
package Dense_Matrices is
   type Dense_Matrix (Rows, Cols: Natural) is 
     new Matrices.Matrix and Store.Storable with private; 

   -- Override primitive subprograms of Matrix interface
   function Element (M: Dense_Matrix; X, Y: Natural) return Float;
   procedure Set_Element
     (M: in out Dense_Matrix; X, Y: Natural; Value: Float);
   procedure Zero(M: in out Dense_Matrix); 

   function Rows (M: Dense_Matrix) return Natural;
   function Cols (M: Dense_Matrix) return Natural;
   function  "="(M1, M2: Dense_Matrix) return Boolean;

   -- Override primitive subprograms of Storable interface
   procedure Copy(From: in Dense_Matrix; To: out Dense_Matrix);
   function  Default(S: Dense_Matrix) return Store.Storable'Class;
private
   type Float_Matrix is 
     array(Natural range <>, Natural range <>) of Float;

   type Dense_Matrix (Rows, Cols: Natural) is 
     new Matrices.Matrix and Store.Storable with 
       record
         Contents: Float_Matrix(1..Rows, 1..Cols) := 
           (others => (others => 0.0));
       end record;
end Dense_Matrices;
