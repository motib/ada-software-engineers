package Buffer_Interface is
  type Buffer is protected interface;
  procedure Append(B: in out Buffer; N: in  Integer) is abstract;
  procedure Take  (B: in out Buffer; N: out Integer) is abstract;
end Buffer_Interface;