--
-- Modular types for checksum.
--
with Ada.Text_IO; use Ada.Text_IO;
procedure Check is

  type Byte is mod 2**8;
  type Byte_Array is array(Natural range <>) of Byte;
  for Byte_Array'Component_Size use 8;
  pragma Pack(Byte_Array);

  function Checksum(A: Byte_Array) return Byte is
    C: Byte := 0;
  begin
    for I in A'Range loop
      C := C + A(I);
    end loop;
    return C;
  end Checksum;

  Message: Byte_Array := (134, 56, 121, 38, 206, 117);
begin
  Put_Line(Byte'Image(Checksum(Message)));
end Check;

