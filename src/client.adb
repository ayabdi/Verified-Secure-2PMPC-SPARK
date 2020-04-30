
with Ada.Text_IO;  use Ada.Text_IO;
with GNAT.Sockets; use GNAT.Sockets;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with OT,Alice, Random;    use OT,Alice, Random;
with Common; use Common;

package body Client is

   task body Reciever is
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

      x1 : LN.Big_Unsigned;
      y1 : LN.Big_Unsigned;


      -- alice is choice and random number
      choice : LN.Big_Unsigned;
      randomR : LN.Big_Unsigned;

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


       -- alice sets choice a and random R
      Put_Line("Alice set choice");
      choice := setChoice;
      randomR := LN.Utils.To_Big_Unsigned("4");


      -- Alice inputs x1 and Generates sequence X and sends it to Bob
      Put_Line("Alice input x1");
      x1 := LN.Utils.To_Big_Unsigned(Integer'Image(GetX));
      ArrUnsigned'Output(Channel , GenerateX(x1, choice));

      --Alice sends Y to Bob
      LN.Big_Unsigned'Output (Channel, OT.computeY(choice, randomR));

      -- (Oblivious Transfer) Alice recieves C
     -- C := TwoDArray'Input(Channel);


      -- Alice computes M = a/b^r
      W := OT.RecieveMessage(TwoDArray'Input(Channel), choice, randomR);


      -- Alice inputs x1 and Generates sequence X and sends it to Bob
      Put_Line("Alice input  y1");
      y1 :=LN.Utils.To_Big_Unsigned(Integer'Image(GetY));

      ArrUnsigned'Output(Channel , GenerateY(y1 , choice));

      -- (Oblivious Transfer) Alice recieves C
      -- C2 := TwoDArray'Input(Channel);

      -- Alice computes M = a/b^r
      T := OT.RecieveMessage(TwoDArray'Input(Channel), choice, randomR);

      -- Alice sends Sequence A
       ArrUnsigned'Output(Channel , Alice.SequenceS(choice));
      -- alice recieves computed a from bob
     -- C3 := TwoDArray'Input(Channel);

    --  Put_Line("Chosen Sequence A is");
     -- New_Line;
      a:= OT.RecieveMessage(TwoDArray'Input(Channel), choice, randomR);

      -- Alice sends Sequence b
       ArrUnsigned'Output(Channel , Alice.SequenceT(choice));

      -- alice recieves computed b from bob
      b := OT.RecieveMessage(TwoDArray'Input(Channel), choice, randomR);




       D := Alice.Distance(T , W, Alice.choiceA_value, Alice.choiceB_value
                    , a , b , LN.Utils.To_Big_Unsigned(Integer'Image(R))
                    ,x1 , y1);

     Put_Line("Distance is ");
     Put(LN.Utils.To_String(D));


   end Reciever;

end Client;
