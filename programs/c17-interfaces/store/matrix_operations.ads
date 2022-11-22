with Matrices;
package Matrix_Operations is
   function Trace(M: Matrices.Matrix'Class) return Float;
   function "="(M1, M2: Matrices.Matrix'Class) return Boolean;
   procedure Display(M: Matrices.Matrix'Class);
end Matrix_Operations;
