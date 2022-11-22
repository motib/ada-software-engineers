separate(CEOT)
  protected body Room is
    entry Register when Entrance = Open is
    begin
      if Size = 1 then
        Entrance := Closed;
        requeue CEO.Wake(Department) with abort;
      end if;
      Waiting := Waiting + 1;
      if Waiting < Size then
        requeue Wait_for_Last_Member with abort;
      else
        Waiting := Waiting - 1;
        Entrance  := Closed;
        Exit_Door := Open;
      end if;
    end Register;

    entry Wait_for_Last_Member when Exit_Door = Open is
    begin
      Waiting := Waiting - 1;
      if Waiting = 0 then
        Exit_Door := Closed;
        requeue CEO.Wake(Department) with abort;
      end if;
    end Wait_for_Last_Member;

    procedure Open_Door is
    begin
      Entrance := Open;
    end Open_Door;
  end Room;
