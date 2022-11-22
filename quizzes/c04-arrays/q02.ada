with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type Name is 
    array(Integer range <>, Integer range <>) of Character;
  Names: constant Name(1..4, 1..6) :=
    ("Kirk  ", "Spock ", "McCoy ", "Scotty");
begin
  Put(Names(4,1));
end Main;

