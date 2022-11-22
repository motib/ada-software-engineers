
with Tasks;
package Channels.Workers is
  type W1_Channel(W: access Tasks.Worker_1) is 
    new Channel with null record;
  procedure Output(C: access W1_Channel);

  type W2_Channel(W: access Tasks.Worker_2) is 
    new Channel with null record;
  procedure Output(C: access W2_Channel);
end Channels.Workers;
