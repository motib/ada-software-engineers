
with Tasks; 
with Channels.Workers; use Channels;
procedure DispTask is
  W1: Tasks.W1_Ptr := new Tasks.Worker_1;
  W2: Tasks.W2_Ptr := new Tasks.Worker_2;
  C1: Channel_Ptr := new Workers.W1_Channel(W1);
  C2: Channel_Ptr := new Workers.W2_Channel(W2);
  Get_Channel: Channel_Ptr := C2;
begin
  Output(Get_Channel);
end DispTask;

