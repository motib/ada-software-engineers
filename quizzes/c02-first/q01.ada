with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
  subtype Letters is Character range 'A'..'Z';
begin
  Put(Letters'Val(42));
  Put(Positive'Val(0));
end Main;

