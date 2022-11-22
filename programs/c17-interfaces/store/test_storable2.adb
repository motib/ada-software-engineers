with Event_Package;
with Sparse_Matrices;
with Store, IO;
procedure Test_Storable2 is
   MS: Sparse_Matrices.Sparse_Matrix(3,3);

   use Event_Package;
   EM1: Main_Engine_Event := Create;
   EA1: Aux_Engine_Event  := Create;
   ES1: Steering_Event := Create;
   S:  Store.Table(10);
begin
   IO.Put("Simulate the three events");
   Simulate(EM1);
   Simulate(EA1);
   Simulate(ES1);

   IO.Put("Show that the Store can contain both matrices and events");
   Store.Insert("MS      ", MS, S);
   Store.Insert("Main Eng", EM1, S);
   IO.Put(Store.Has_Element("Main Eng", S));
   IO.Put(Store.Has_Element("MS      ", S));

   IO.Put("Insert some more events into the Store");
   IO.Put(Store.Has_Element("Aux Eng ", S));
   Store.Insert("Aux Eng ", EA1, S);
   Store.Insert("Steering", ES1, S);
   IO.Put(Store.Has_Element("Aux Eng ", S));
   IO.Put(Store.Has_Element("Steering", S));

   declare
     EM2: Main_Engine_Event;
     EA2: Aux_Engine_Event;
     ES2: Steering_Event;
   begin
     IO.Put("Remove the events from the store to new variables and simulate");
     Store.Remove("Main Eng", EM2, S);
     Store.Remove("Aux Eng ", EA2, S);
     Store.Remove("Steering", ES2, S);
     Simulate(EM2);
     Simulate(EA2);
     Simulate(ES2);
   end;

   IO.Put("Insert an event and remove to a variable of a different type");
   begin
     Store.Insert("Error   ", Engine_Event'Class(EA1), S);
     Store.Remove("Error   ", Engine_Event'Class(EM1), S);
   exception
     when Constraint_Error =>
       IO.Put("Can't assign Aux_Engine_Event to Main_Engine_Event");
   end;
end Test_Storable2;
