
with Tasks;
procedure Config is
  W1: aliased Tasks.Worker_Task('A');
  W2: aliased Tasks.Worker_Task('B');  
  M:  Tasks.Main_Task(W2'Access, W1'Access);
begin
  null;
end Config;

