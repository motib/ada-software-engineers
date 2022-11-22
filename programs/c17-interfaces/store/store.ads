package Store is
   type Storable is interface;
   function Default(S: Storable) return Storable'Class is abstract;
   procedure Copy(From: in Storable; To: out Storable) is abstract;

   type Table (Size: Natural) is private;
   subtype Handle_Type is String(1..8);
   procedure Insert(
     Handle: in Handle_Type; S: in Storable'Class; T: in out Table);
   procedure Remove(
     Handle: in Handle_Type; S: out Storable'Class; T: in out Table);
   function  Has_Element(Handle: in Handle_Type; T: Table) return Boolean;

   Table_Overflow, Copy_Error: exception;
private
   Blanks: constant Handle_Type := (others => ' ');
   type Item is
     record
       Handle: Handle_Type := Blanks;
       Reference: access Storable'Class;
     end record;
   type Item_Array is array(Natural range <>) of Item;
   type Table(Size: Natural) is 
     record
       Contents: Item_Array(0 .. Size) := (others => <>);
     end record;
end Store;
