package body Dense_Matrices is
   function Element (M: Dense_Matrix; X, Y: Natural) return Float is
   begin
      return M.Contents (X, Y);
   end Element;

   procedure Set_Element
     (M: in out Dense_Matrix; X, Y: Natural; Value: Float) is
   begin
      M.Contents (X, Y) := Value;
   end Set_Element;

   procedure Zero(M: in out Dense_Matrix) is
   begin
     M := (M.Rows, M.Cols, (others => (others => 0.0)));
   end Zero;

   function Rows (M: Dense_Matrix) return Natural is
   begin
      return M.Rows;
   end Rows;

   function Cols (M: Dense_Matrix) return Natural is
   begin
      return M.Cols;
   end Cols;

  function "="(M1, M2 : Dense_Matrix) return Boolean is
  begin
     return M1.Contents = M2.Contents;
  end "=";

  procedure Copy(From: in Dense_Matrix; To: out Dense_Matrix) is
  begin
    if From.Rows /= To.Rows or From.Cols /= To.Cols then
      raise Store.Copy_Error;
    else
      To.Contents := From.Contents;
    end if;
  end Copy;

  function  Default(S: Dense_Matrix) return Store.Storable'Class is
  begin
    return Store.Storable'Class(
        Dense_Matrix'(S.Rows, S.Cols, Contents => (others => (others => 0.0)))
      );
  end Default;
end Dense_Matrices;
