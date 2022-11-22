with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with System; with Ada.Unchecked_Conversion; 
procedure Message is

  type Byte is mod 2**System.Storage_Unit;
  for Byte'Size use System.Storage_Unit;
  package Byte_IO is new Ada.Text_IO.Modular_IO(Byte);
  use Byte_IO;

  type Codes is (M0, M1, M2, M3);
  for Codes'Size use System.Storage_Unit;

  type Structured_Message(Code: Codes) is
    record
      Addressee: Byte;
      Sender: Byte;
      Sequence_Number: Byte;
      case Code is
        when M0 => null;
        when M1 => A: Integer;
        when M2 => B: Character;
        when M3 => C: Integer; D: Integer;
      end case;
    end record;
  pragma Pack(Structured_Message);

  Max_Bytes: constant Integer := 
    Structured_Message'Size/System.Storage_Unit;
  type Raw_Message is array(1..Max_Bytes) of Byte;
  pragma Pack(Raw_Message);

  function To_Raw is new Ada.Unchecked_Conversion(
    Source => Structured_Message, Target => Raw_Message);

  function To_Structured is new Ada.Unchecked_Conversion(
    Source => Raw_Message, Target => Structured_Message);

  function Send_Message(S: Structured_Message) return Raw_Message is
  begin
    return To_Raw(S);
  end Send_Message;

  procedure Process_Message(R: Raw_Message) is
    S: Structured_Message := To_Structured(R);
  begin
    Put("Message number "); Put(S.Sequence_Number);
    Put(" of type " & Codes'Image(S.Code) & "  ");
    Put(" sent by "); Put(S.Sender);
    Put(" to "); Put(S.Addressee); New_Line;
    Put("Text of message is ");
    case S.Code is
      when M0 => null;
      when M1 => Put(S.A);
      when M2 => Put(S.B);
      when M3 => Put(S.C); Put(S.D);
    end case;
    New_Line;
  end Process_Message;

begin
  Process_Message(Send_Message((M1, 11, 32, 1, 54)));
  Process_Message(Send_Message((M2, 32, 11, 2, 'X')));
  Process_Message(Send_Message((M3, 32, 11, 3, 45, 68)));
end Message;

