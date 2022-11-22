pragma Priority_Specific_Dispatching(
  FIFO_Within_Priorities, 5, 10);
pragma Priority_Specific_Dispatching(
  Round_Robin_Within_Priorities, 10, 15);
procedure Main is
begin
  null;
end Main;
