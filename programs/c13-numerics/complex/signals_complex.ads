with Signals;
with Ada.Numerics.Generic_Complex_Types;
package Signals_Complex is 
  new Ada.Numerics.Generic_Complex_Types(Signals.Real);
