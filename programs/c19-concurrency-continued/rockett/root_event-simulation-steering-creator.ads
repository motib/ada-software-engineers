package Root_Event.Simulation.Steering.Creator is
  type Create(P: access Producer) is limited private;
private
  task type Create(P: access Producer);
end Root_Event.Simulation.Steering.Creator;
