package body Store is
   procedure Insert(
     Handle: in Handle_Type; S: in Storable'Class; T: in out Table) is
   begin
     for I in T.Contents'Range loop
       if T.Contents(I).Handle = Blanks then
         T.Contents(I) := 
           (Handle, new Storable'Class'(Default(S)));
         Copy(From => S, To => T.Contents(I).Reference.all);
         return;
       end if;
     end loop;
     raise Table_Overflow;
   end Insert;

   procedure Remove(
     Handle: in Handle_Type; S: out Storable'Class; T: in out Table) is
   begin
     for I in T.Contents'Range loop
       if Handle = T.Contents(I).Handle then
         T.Contents(I).Handle := Blanks;
         Copy(From => T.Contents(I).Reference.all, To => S);
         return;
       end if;
     end loop;
   end Remove;

   function  Has_Element(Handle: in Handle_Type; T: Table) return Boolean is
   begin
     for I in T.Contents'Range loop
       if Handle = T.Contents(I).Handle then
         return True;
       end if;
     end loop;
     return False;
   end Has_Element;
end Store;
