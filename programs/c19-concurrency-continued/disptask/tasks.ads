--
-- Access discriminants for "dispatching" to an entry.
--
package Tasks is
  task type Worker_1 is
    entry Input;
  end Worker_1;
  type W1_Ptr is access Worker_1;

  task type Worker_2 is
    entry Input;
  end Worker_2;
  type W2_Ptr is access Worker_2;
end Tasks;
