--
-- Access discriminants used for task configuration.
--
package Tasks is
  task type Worker_Task(ID: Character) is
    entry Input;
  end Worker_Task;
  task type Main_Task(Left, Right: access Worker_Task);
end Tasks;
