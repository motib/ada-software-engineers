with Buffer_Interface;
package Task_Buffer is
  task type Buffer is new Buffer_Interface.Buffer with
    entry Append(I: in  Integer);
    entry Take  (I: out Integer);
  end Buffer;
end Task_Buffer;