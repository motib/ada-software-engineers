with Priority_Queue;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
procedure Save1 is
  type Exception_Record is
    record
      Priority:   Positive;
      Occurrence: Exception_Occurrence_Access;
    end record;
  function "<"(Left, Right: Exception_Record) return Boolean is
  begin
    return Left.Priority < Right.Priority;
  end "<";

  package Exception_Queue is new Priority_Queue(Exception_Record);
  use Exception_Queue;
  Q: aliased Queue;

  Ex1, Ex2, Ex3: exception;
begin
  begin
    raise Ex1;
  exception
    when E: others => Put(Exception_Record'(13, Save_Occurrence(E)), Q);
  end;
  begin
    raise Ex2;
  exception
    when E: others => Put(Exception_Record'(6, Save_Occurrence(E)), Q);
  end;
  begin
    raise Ex3;
  exception
    when E: others => Put(Exception_Record'(8, Save_Occurrence(E)), Q);
  end;
  while not Empty(Q) loop
    begin
      Reraise_Occurrence(Get(Q'Access).Occurrence.all);
    exception
      when EE: others => Put(Exception_Information(EE));
    end;
  end loop;
end Save1;
