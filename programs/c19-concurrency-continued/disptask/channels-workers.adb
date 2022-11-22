
package body Channels.Workers is
  procedure Output(C: access W1_Channel) is
  begin
    C.W.Input;
  end Output;

  procedure Output(C: access W2_Channel) is
  begin
    C.W.Input;
  end Output;
end Channels.Workers;
