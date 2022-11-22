package body Sparse_Matrices is
   function Element (M: Sparse_Matrix; X, Y: Natural) return Float is
     Ptr: access Item := M.Contents;
   begin
     loop
      if Ptr.X < X or else (Ptr.X = X and Ptr.Y < Y) then
        Ptr := Ptr.Next;
      elsif Ptr.X = X and Ptr.Y = Y then
        return Ptr.Value;
      else -- (X,Y) not in matrix
        return 0.0;
      end if;
     end loop;
   end Element;

   procedure Set_Element
       (M: in out Sparse_Matrix; X, Y: Natural; Value: Float) is
     Ptr: access Item := M.Contents;
   begin
     loop
       if Ptr.Next.X < X or else
             (Ptr.Next.X = X and Ptr.Next.Y < Y) then
         Ptr := Ptr.Next;
       elsif Ptr.Next.X = X and Ptr.Next.Y = Y then
         Ptr.Next.Value := Value;
         return;
       else
         Ptr.Next := new Item'(Value, X, Y, Ptr.Next);
         return;
       end if;
     end loop;
   end Set_Element;

   procedure Zero(M: in out Sparse_Matrix) is
   begin
     M := (M.Rows, M.Cols, 
           new Item'(0.0, -1, -1,
           new Item'(0.0, Natural'Last, Natural'Last, null)));
   end Zero;

   function Rows(M: Sparse_Matrix) return Natural is
   begin
     return M.Rows;
   end Rows;

   function Cols(M: Sparse_Matrix) return Natural is
   begin
     return M.Cols;
   end Cols;

   function  "="(M1, M2: Sparse_Matrix) return Boolean is
     Ptr1: access Item := M1.Contents;
     Ptr2: access Item := M2.Contents;
   begin
     loop
       if Ptr1 = null and Ptr2 = null then
         return True;
       elsif Ptr1 = null or Ptr2 = null then
         return False;
       elsif Ptr1.X /= Ptr2.Y or 
             Ptr1.Y /= Ptr2.Y or 
             Ptr1.Value /= Ptr2.Value then
           return False;
       else
         Ptr1 := Ptr1.Next;
         Ptr2 := Ptr2.Next;
       end if;
     end loop;
   end "=";

   procedure Copy(From: in Sparse_Matrix; To: out Sparse_Matrix) is
     Ptr: access Item := From.Contents.Next;
   begin
     if From.Rows /= To.Rows or From.Cols /= To.Cols then
       raise Store.Copy_Error;
     end if;
     while Ptr.X /= Natural'Last loop
       Set_Element(To, Ptr.X, Ptr.Y, Ptr.Value);
       Ptr := Ptr.Next;
     end loop;
   end Copy;

   function  Default(S: Sparse_Matrix) return Store.Storable'Class is
   begin
     return 
       Store.Storable'Class(
         Sparse_Matrix'(
             S.Rows, S.Cols,
             Contents =>
               new Item'(0.0, -1, -1,
               new Item'(0.0, Natural'Last, Natural'Last, null))
         )
       );
    end Default;
end Sparse_Matrices;
