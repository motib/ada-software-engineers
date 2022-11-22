with Ada.Text_IO;
procedure Level is
  type Ptr is access all Integer;

  Global: aliased Integer := 6;
  
  function F return Ptr is
    Local: aliased Integer := 7;
  begin
--    return Global'Access;
    return Local'Access;
  end F;

  P: Ptr := F;
begin
  Ada.Text_IO.Put_Line(Integer'Image(P.all));
end Level;

