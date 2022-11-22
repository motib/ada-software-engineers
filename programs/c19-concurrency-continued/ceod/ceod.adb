pragma Queuing_Policy(Priority_Queuing);
with Ada.Text_IO; use Ada.Text_IO;
procedure CEOD is

  type Departments is (Engineering, Finance, Marketing);
  type ID_Numbers is range 0..10;
  Group_Size: constant array(Departments) of 
    ID_Numbers range 2..ID_Numbers'Last := (
      Engineering => 5, Finance => 3, Marketing => 2);

  task CEO is
    entry Wake(Departments);
    entry Invite_In(Departments)(ID: ID_Numbers);
    entry Show_Out(Departments)(ID:  ID_Numbers);
  end CEO;

  type Door_State is (Open, Closed);

  protected type Room(Department: Departments; Size: ID_Numbers) is
    entry Register;
    procedure Open_Door;
  private
    entry Wait_for_Last_Member;
    Waiting:   ID_Numbers := 0;
    Entrance:  Door_State := Open;
    Exit_Door: Door_State := Closed;
  end Room;

  protected body Room is separate;

  Engineering_Room: Room(Engineering, Group_Size(Engineering));
  Finance_Room:     Room(Finance,     Group_Size(Finance));
  Marketing_Room:   Room(Marketing,   Group_Size(Marketing));

  task body CEO is
    I: ID_Numbers;
  begin
    loop
      Put_Line("CEO is playing golf");
      select
        accept Wake(Finance);
        for N in 1..Group_Size(Finance) loop
          accept Invite_In(Finance)(ID: ID_Numbers) do
            I := ID;
          end Invite_In;
          Put_Line("Accountant " & ID_Numbers'Image(I) & " in office");
        end loop;
        Put_Line("CEO is talking");
        for N in 1..Group_Size(Finance) loop
          accept Show_Out(Finance)(ID: ID_Numbers) do
            I := ID;
          end Show_Out;
          Put_Line("Accountant " & ID_Numbers'Image(I) & " left office");
        end loop;
        Finance_Room.Open_Door;
      or
        when Wake(Finance)'Count = 0 =>
        accept Wake(Marketing);
        for N in 1..Group_Size(Marketing) loop
          accept Invite_In(Marketing)(ID: ID_Numbers) do
            I := ID;
          end Invite_In;
          Put_Line("Salesperson " & ID_Numbers'Image(I) & " in office");
        end loop;
        Put_Line("CEO is shouting");
        for N in 1..Group_Size(Marketing) loop
          accept Show_Out(Marketing)(ID: ID_Numbers) do
            I := ID;
          end Show_Out;
          Put_Line("Salesperson " & ID_Numbers'Image(I) & " left office");
        end loop;
        Marketing_Room.Open_Door;
      or
        when Wake(Finance)'Count = 0 and
             Wake(Marketing)'Count = 0 =>
        accept Wake(Engineering);
        for N in 1..Group_Size(Engineering) loop
          accept Invite_In(Engineering)(ID: ID_Numbers) do
            I := ID;
          end Invite_In;
          Put_Line("Engineer " & ID_Numbers'Image(I) & " in office");
        end loop;
        Put_Line("CEO is screaming");
        for N in 1..Group_Size(Engineering) loop
          accept Show_Out(Engineering)(ID: ID_Numbers) do
            I := ID;
          end Show_Out;
          Put_Line("Engineer " & ID_Numbers'Image(I) & " left office");
        end loop;
        Engineering_Room.Open_Door;
      or
        delay 1.0;
        Put_Line("Flying to new golf course");
      end select;
    end loop;
  end CEO;

  task type Engineer_Task(ID: ID_Numbers);
  task body Engineer_Task is
  begin
    loop
      Put_Line("Engineer " & ID_Numbers'Image(ID) & " debugging");
      delay 1.0;
      Engineering_Room.Register;
      CEO.Invite_In(Engineering)(ID);
      Put_Line("Engineer " & ID_Numbers'Image(ID) & " receiving orders");
      CEO.Show_Out(Engineering)(ID);
    end loop;
  end Engineer_Task;

  task type Finance_Task(ID: ID_Numbers);
  task body Finance_Task is
  begin
    loop
      Put_Line("Accountant " & ID_Numbers'Image(ID) & " calculating");
      delay 4.0;
      Finance_Room.Register;
      CEO.Invite_In(Finance)(ID);
      Put_Line("Accountant " & ID_Numbers'Image(ID) & " receiving orders");
      CEO.Show_Out(Finance)(ID);
    end loop;
  end Finance_Task;

  task type Marketing_Task(ID: ID_Numbers);
  task body Marketing_Task is
  begin
    loop
      Put_Line("Salesperson " & ID_Numbers'Image(ID) & " talking");
      delay 2.0;
      Marketing_Room.Register;
      CEO.Invite_In(Marketing)(ID);
      Put_Line("Salesperson " & ID_Numbers'Image(ID) & " receiving orders");
      CEO.Show_Out(Marketing)(ID);
    end loop;
  end Marketing_Task;

  type Engineer_Ptr is access Engineer_Task;
  type Finance_Ptr is access Finance_Task;
  type Marketing_Ptr is access Marketing_Task;

  Engineers:    array(1..7) of Engineer_Ptr;
  Accountants:  array(1..5) of Finance_Ptr;
  Salespersons: array(1..8) of Marketing_Ptr;

begin
  for I in Engineers'Range loop
    Engineers(I) := new Engineer_Task(ID_Numbers(I));
  end loop;
  for I in Accountants'Range loop
    Accountants(I) := new Finance_Task(ID_Numbers(I));
  end loop;
  for I in Salespersons'Range loop
    Salespersons(I) := new Marketing_Task(ID_Numbers(I));
  end loop;

  delay 15.0;
  Put_Line("The company is bankrupt, fire everyone");

  for I in Engineers'Range loop
    abort Engineers(I).all;
  end loop;
  for I in Accountants'Range loop
    abort Accountants(I).all;
  end loop;
  for I in Salespersons'Range loop
    abort Salespersons(I).all;
  end loop;
end CEOD;
