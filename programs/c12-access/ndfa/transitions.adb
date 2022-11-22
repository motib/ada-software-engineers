with Ada.Text_IO; use Ada.Text_IO;
with States;
with Ada.Strings.Fixed;
package body Transitions is

   procedure Debug (T: in Transition) is
   begin
      Put(Ada.Strings.Fixed.Trim(T.From.Name, Ada.Strings.Right));
      Put('-' & T.Symbol & "->");
      Put(Ada.Strings.Fixed.Trim(T.To.Name, Ada.Strings.Right));
   end Debug;

end Transitions;

