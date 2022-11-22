package body Root_Event.Simulation is

  procedure Put(E: in Event'Class; P: in out Producer) is
  begin
    Event_Queue.Put(E, P.Queue);
  end Put;

  function Get(P: access Producer) return Event'Class is
  begin
    return Event_Queue.Get(P.Queue'Access);
  end Get;
      
  function Random(P: Producer) return Natural is
  begin
    return Random_Time.Random(P.Generator);
  end Random;
  
  function Random_Update(P: access Producer) return Simulation_Time is
  begin
    P.Latest := P.Latest + (Random(P.all) mod Simulation_Interval'Last);
    return P.Latest;
  end Random_Update;
  
end Root_Event.Simulation;
