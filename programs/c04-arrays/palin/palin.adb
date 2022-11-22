--
-- Create a palindrome from a string.
--
with Ada.Text_IO; use Ada.Text_IO;
procedure Palin is
  function Palindrome(S: in String) return String is
    T: String(1..2*S'Length);
  begin
    T(1..S'Length) := S;  -- Slice as a variable
    for N in S'Range loop
      T(T'Length - (N-S'First)) := S(N);
    end loop;
    return T;
  end Palindrome;

  S1: String := "Hello world";
  S2: String(100..100+2*S1'Length-1) := Palindrome(S1);
  S3: String(1..2*S2'Length) := Palindrome(S2);

begin
  Put_Line(S1);
  Put_Line(S2);
  Put_Line(S3);
end Palin;
