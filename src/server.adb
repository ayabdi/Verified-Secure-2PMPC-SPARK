
with Ada.Text_IO;  use Ada.Text_IO;
with GNAT.Sockets; use GNAT.Sockets;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--with Hierarchy;    use Hierarchy;
with Common,OT, Alice, Bob; use OT, Alice, Bob, Common;
with Ada.Text_IO, Ada.Command_Line, Crypto.Types.Big_Numbers;
pragma Elaborate_All(Crypto.Types.Big_Numbers);

package body Server is

   task body Worker is
      Address : Sock_Addr_Type;
      Socket  : Socket_Type;
      Server  : Socket_Type;
      Channel : Stream_Access;

      C : LN.Big_Unsigned;
      D : LN.Big_Unsigned;
      X2: Integer;
      Y2: Integer;
      Xarr : XY_array(m);
      Yarr : XY_array(m);
     -- T : XY_array(m);

   begin
      accept Start;
      --  Create socket and listen input from client
      Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
      Address.Port := Common.Port;
      Create_Socket (Server);
      Bind_Socket (Server, Address);
      Listen_Socket (Server);

      accept Done;
      Accept_Socket (Server, Socket, Address);
      --  A client has been accepted, get the stream connected to the socket
      Channel := Stream (Socket);
      -----------------------------------------------------------------------------------------------------------------------------------------
      -----------------------------------------------------------------------------------------------------------------------------------------
      -- Bob recieves Random sequence X from Alice
      Xarr := XY_array'Input (Channel);

      -- Bob inputs X2
      Put_Line("Bob input x2");
      X2 := Bob.GetX2;

      -- (Oblivious Transfer)Bob recieves Y
      C :=  LN.Big_Unsigned'Input (Channel);

      --Bob Computes C and sends it back to Y
      TwoDArray'Output (Channel , ComputeC(C, Bob.ComputeT(Xarr, 1 , X2)));

      ----------------------------------------------------------------------------------------------------------------------------------------
     -- Bob recieves Random sequence Y from Alice
      Yarr := XY_array'Input (Channel);

      -- Bob inputs Y2
      Put_Line("Bob input Y2");
      Y2 := Bob.GetY2;

      --Bob Computes C for Y and sends it to ALice
      TwoDArray'Output (Channel , ComputeC(C, Bob.ComputeT(Yarr, 1 , Y2)));
   end Worker;


end Server;
