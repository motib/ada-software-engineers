with Array_Priority_Queue; use Array_Priority_Queue;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
procedure Assert is
  Q: Queue(10);
  I: Integer;
begin
--  Put(10, Q);
  Get(I, Q);
exception
  when X: others => Put(Exception_Information(X));  
end Assert;
