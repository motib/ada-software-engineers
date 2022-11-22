with P;
package Legal is
  type Non_Lim is tagged null record;
  type Lim is tagged limited null record;
  package Instance is new P(Parent => Non_Lim, Component_Type => Lim);
end Legal;

