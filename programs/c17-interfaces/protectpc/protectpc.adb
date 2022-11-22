with Ada.Text_IO; use Ada.Text_IO;
with Buffer_Interface;
with Protected_Buffer;
procedure ProtectPC is
  Buffer: access Buffer_Interface.Buffer'Class := new Protected_Buffer.Buffer;

  task Producer;
  task body Producer is
  begin
    for N in 1..200 loop
      Put_Line("Producing " & Integer'Image(N));
      Buffer.Append(N);
    end loop;
  end Producer;

  task type Consumer(ID: Integer);
  task body Consumer is
    N: Integer;
  begin
    loop
      Buffer.Take(N);
      Put_Line(Integer'Image(ID) & " consuming " & Integer'Image(N));
    end loop;
  end Consumer;

  C1: Consumer(1);
  C2: Consumer(2);

begin
  null;
end ProtectPC;
