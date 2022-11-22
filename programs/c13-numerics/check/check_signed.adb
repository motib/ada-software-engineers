--
-- Modular types for checksum
-- Mod attribute to convert any integer
--   value to a modular type
--
with Ada.Text_IO; use Ada.Text_IO;
procedure Check_Signed is

  type Short is range -(2**7)..2**7-1;
  type Short_Array is array(Natural range <>) of Short;
  for Short_Array'Component_Size use 8;
  pragma Pack(Short_Array);

  type Byte is mod 2**8;
  function Checksum(A: Short_Array) return Byte is
    C: Byte := 0;
  begin
    for I in A'Range loop
      C := C + Byte'Mod(A(I));
    end loop;
    return C;
  end Checksum;

  Message: Short_Array := (-122, 56, 121, 38, -50, 117);
begin
  Put_Line(Byte'Image(Checksum(Message)));
end Check_Signed;
