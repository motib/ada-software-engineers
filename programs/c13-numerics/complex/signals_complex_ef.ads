with Signals;
with Signals_Complex;
with Ada.Numerics.Generic_Complex_Elementary_Functions;
package Signals_Complex_EF is 
  new Ada.Numerics.Generic_Complex_Elementary_Functions(Signals_Complex);
