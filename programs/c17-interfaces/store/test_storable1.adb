with Dense_Matrices, Sparse_Matrices, Matrix_Operations;
with Store, IO;
procedure Test_Storable1 is
   MD1, MD2: Dense_Matrices.Dense_Matrix(3,3);
   MS1, MS2: Sparse_Matrices.Sparse_Matrix(3,3);
   S:  Store.Table(10);
begin
   IO.Put("Create a dense matrix MD1 and display it");
   Dense_Matrices.Set_Element(MD1, 2, 2, 4.0);
   Dense_Matrices.Set_Element(MD1, 1, 1, 1.0);
   Dense_Matrices.Set_Element(MD1, 3, 3, 9.0);
   Matrix_Operations.Display(MD1);

   IO.Put("Create the same matrix as a sparse matrix MS1 and display it");
   Sparse_Matrices.Set_Element(MS1, 2, 2, 4.0);
   Sparse_Matrices.Set_Element(MS1, 1, 1, 1.0);
   Sparse_Matrices.Set_Element(MS1, 3, 3, 9.0);
   Matrix_Operations.Display(MS1);

   IO.Put("Copy the dense matrix MD1 to MD2 and check if the same");
   Dense_Matrices.Copy(From => MD1, To => MD2);
   Matrix_Operations.Display(MD2);
   IO.Put(Dense_Matrices."="(MD1, MD2));

   IO.Put("Copy the sparse matrix MS1 to MS2 and check if the same");
   Sparse_Matrices.Copy(From => MS1, To => MS2);
   Matrix_Operations.Display(MS2);
   IO.Put(Sparse_Matrices."="(MS1, MS2));

   IO.Put("Insert MD1 in the Store and check if MD1 and MS1 are in the Store");
   Store.Insert("MD1     ", MD1, S);
   IO.Put(Store.Has_Element("MD1     ", S));
   IO.Put(Store.Has_Element("MS1     ", S));

   IO.Put("Insert MS1 in the Store and check if MS1 is now in the Store");
   Store.Insert("MS1     ", MS1, S);
   IO.Put(Store.Has_Element("MS1     ", S));

   IO.Put("Zero MD2 and MS2");
   MD2.Zero;
   Matrix_Operations.Display(MD2);
   MS2.Zero;
   Matrix_Operations.Display(MS2);

   IO.Put("Remove MD1 and MS1 and put into MD2 and MS2, respectively");
   Store.Remove("MD1     ", MD2, S);
   Matrix_Operations.Display(MD2);
   Store.Remove("MS1     ", MS2, S);
   Matrix_Operations.Display(MS2);

   IO.Put("Checking operations in Matrix_Operations package");
   IO.Put("Compute the traces of MD1 and MS1");
   IO.Put(Matrix_Operations.Trace(MD1));
   IO.Put(Matrix_Operations.Trace(MS1));
   IO.Put("");

   IO.Put("Compute dense matrix MD1 = sparse matrix MS1");
   IO.Put(Matrix_Operations."="(MD1, MS1));
end Test_Storable1;
