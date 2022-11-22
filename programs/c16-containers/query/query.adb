with Ada.Text_IO, Ada.Containers.Doubly_Linked_Lists;
procedure Query is
  type Data_Type is 
    record
      Empty: Boolean;
      Data:  String(1..4095);
    end record;

  package Data_Lists is
    new Ada.Containers.Doubly_Linked_Lists(Element_Type => Data_Type);
  List: Data_Lists.List;

  function Is_Empty(Position: in Data_Lists.Cursor) return Boolean is
    Empty_Element: Boolean;
    procedure Is_Element_Empty(D: Data_Type) is
    begin
      Empty_Element := D.Empty;
    end Is_Element_Empty;
  begin
    Data_Lists.Query_Element(Position, Is_Element_Empty'Access);
    return Empty_Element;
  end Is_Empty;

begin
  List.Append(Data_Type'(True,  (others => ' ')));
  List.Append(Data_Type'(False, "Hello World" & (12..4095 => ' ')));
  Ada.Text_IO.Put_Line(Boolean'Image(Is_Empty(List.First)));
  Ada.Text_IO.Put_Line(Boolean'Image(Is_Empty(List.Last)));
end Query;
