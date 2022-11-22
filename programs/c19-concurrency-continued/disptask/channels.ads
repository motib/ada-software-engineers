
package Channels is
  type Channel is abstract tagged limited null record;
  procedure Output(C: access Channel) is abstract;
  type Channel_Ptr is access all Channel'Class;
end Channels;
