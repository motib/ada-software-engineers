with Heterogeneous_Priority_Queue;
with Ada.Numerics.Discrete_Random;
package Root_Event.Simulation is

  -- Produces events for the simulation
  type Producer is limited private;
  
  procedure Put(E: in Event'Class; P: in out Producer);
  function  Get(P: access Producer) return Event'Class;

private
 
  package Event_Queue is new
    Heterogeneous_Priority_Queue(Event'Class);
  package Random_Time is new 
    Ada.Numerics.Discrete_Random(Natural);

  type Producer is
    record
      Queue:     aliased Event_Queue.Queue;
      Generator: Random_Time.Generator;
      Latest:    Simulation_Time := Simulation_Time'First;
    end record;

  function Random(P: Producer) return Natural;
  function Random_Update(P: access Producer) return Simulation_Time;
  -- Return a random time greater than Latest and update Latest
end Root_Event.Simulation;
