
with Ada.Text_IO;  use Ada.Text_IO;
with GNAT.Sockets; use GNAT.Sockets;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with OT,Alice;    use OT,Alice;
with Common; use Common;

package body Client is

   task body Worker is
      Address  : Sock_Addr_Type;
      Socket   : Socket_Type;
      Channel  : Stream_Access;
      C : TwoDArray(m,1..2);
      C2 : TwoDArray(m,1..2);
     -- X : Integer;
      --Y : Integer;

   begin
      accept Start;

      --  Connect to the server

      Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
      Address.Port := Common.Port;
      Create_Socket (Socket);
      Connect_Socket (Socket, Address);
      --  Connected, use a stream connected to the socket

      Channel := Stream (Socket);
      -----------------------------------------------------------------------------------------------------------------------------------------------------
      -------------------------------------------------------------------------------------------------------------------------------------------------

      -- Alice inputs x1 and Generates sequence X and sends it to Bob
      Put_Line("Alice input  x1");
      XY_array'Output(Channel , GenerateX(GetX));


      --OT.RandomGen;
      --Alice sends Y to Bob
      LN.Big_Unsigned'Output (Channel, OT.computeY);

      -- (Oblivious Transfer) Alice recieves C
      C := TwoDArray'Input(Channel);


      -- Alice computes M = a/b^r
      Put_Line("Chosen message is");
      Put(LN.Utils.To_String(OT.RecieveMessage(C, LN.Utils.To_Big_Unsigned("2"))));
      New_Line;

      -- Alice inputs x1 and Generates sequence X and sends it to Bob
      Put_Line("Alice input  y1");
      XY_array'Output(Channel , GenerateY(GetY));


      --OT.RandomGen;
      --Alice sends Y to Bob
     -- LN.Big_Unsigned'Output (Channel, OT.computeY);

      -- (Oblivious Transfer) Alice recieves C
      C2 := TwoDArray'Input(Channel);


      -- Alice computes M = a/b^r
      Put_Line("Chosen message is");
      Put(LN.Utils.To_String(OT.RecieveMessage(C2, LN.Utils.To_Big_Unsigned("2"))));

   end Worker;

end Client;
