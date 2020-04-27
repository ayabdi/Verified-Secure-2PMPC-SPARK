
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
      R : Integer;
      C : TwoDArray(m,1..2);
      C2 : TwoDArray(m,1..2);
      C3 : TwoDArray(m,1..2);
      C4 : TwoDArray(m,1..2);
      a : Ln.Big_Unsigned;
      b : Ln.Big_Unsigned;
      T : Ln.Big_Unsigned;
      W : Ln.Big_Unsigned;
      D : Ln.Big_Unsigned;
      x1 : Integer;
      y1 : Integer;

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
      -- Alice recieves Total R
      R := Integer'Input(Channel);

      -- Alice inputs x1 and Generates sequence X and sends it to Bob
      Put_Line("Alice input x1");
      x1 := GetX;
     -- a := Alice.randomA
      XY_array'Output(Channel , GenerateX(x1));

      --OT.RandomGen;
      --Alice sends Y to Bob
      LN.Big_Unsigned'Output (Channel, OT.computeY);

      -- (Oblivious Transfer) Alice recieves C
     -- C := TwoDArray'Input(Channel);


      -- Alice computes M = a/b^r
      W := OT.RecieveMessage(TwoDArray'Input(Channel), LN.Utils.To_Big_Unsigned("2"));


      -- Alice inputs x1 and Generates sequence X and sends it to Bob
      Put_Line("Alice input  y1");
      y1 :=getY ;

      XY_array'Output(Channel , GenerateY(y1));

      -- (Oblivious Transfer) Alice recieves C
      -- C2 := TwoDArray'Input(Channel);

      -- Alice computes M = a/b^r
      T := OT.RecieveMessage(TwoDArray'Input(Channel), LN.Utils.To_Big_Unsigned("2"));

      -- Alice sends Sequence A
      XY_array'Output(Channel , Alice.SequenceS);
      -- alice recieves computed a from bob
     -- C3 := TwoDArray'Input(Channel);

    --  Put_Line("Chosen Sequence A is");
     -- New_Line;
      a:= OT.RecieveMessage(TwoDArray'Input(Channel), LN.Utils.To_Big_Unsigned("2"));

      -- Alice sends Sequence b
      XY_array'Output(Channel , Alice.SequenceT);

      -- alice recieves computed b from bob
      b := OT.RecieveMessage(TwoDArray'Input(Channel), LN.Utils.To_Big_Unsigned("2"));




       D := Distance(T , W, LN.Utils.To_Big_Unsigned(Integer'Image(Alice.choiceA_value)), LN.Utils.To_Big_Unsigned(Integer'Image(Alice.choiceB_value))
                    , a , b , LN.Utils.To_Big_Unsigned(Integer'Image(R))
                    , LN.Utils.To_Big_Unsigned(Integer'Image(x1)) , LN.Utils.To_Big_Unsigned(Integer'Image(y1)));

     Put_Line("Distance is ");
     Put(LN.Utils.To_String(D));





   end Worker;

end Client;
