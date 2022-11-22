with IO;
package body  Matrix_Operations is
   function Trace(M: Matrices.Matrix'Class) return Float is
     Result : Float := 0.0;
   begin
      for J in 1 .. M.Rows loop
         Result := Result + M.Element (J, J);
      end loop;
      return Result;
   end Trace;

   function "="(M1, M2: Matrices.Matrix'Class) return Boolean is
   begin
      if M1.Rows /= M2.Rows or M1.Cols /= M2.Cols then
         return False;
      end if;
      for J in 1 .. M1.Rows loop
         for K in 1 .. M1.Cols loop
            if M1.Element (J, K) /= M2.Element (J, K) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end "=";

   procedure Display(M: Matrices.Matrix'Class) is
   begin
      for J in 1 .. M.Cols loop
         for K in 1 .. M.Rows loop
           IO.Put(M.Element(J,K));
         end loop;
         IO.Put("");
      end loop;
   end;
end Matrix_Operations;
