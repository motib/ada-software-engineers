generic
  type Parent is tagged limited private;
  type Component_Type is limited private;
package P is
  pragma Elaborate_Body;
  type T1 is new Parent with
    record
      X: Component_Type;
    end record;
  procedure Proc(A: T1);
private
  type T2 is new Parent with
    record
      X: Component_Type;
    end record;
end P;
