
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

      XArr : ArrUnsigned ;
      YArr: ArrUnsigned;
      Sarr: ArrUnsigned;
      Tarr : ArrUnsigned;


      a : Ln.Big_Unsigned;
      b : Ln.Big_Unsigned;
      T : Ln.Big_Unsigned;
      W : Ln.Big_Unsigned;
      D : Ln.Big_Unsigned;

      x1 : LN.Big_Unsigned;
      y1 : LN.Big_Unsigned;


      -- alice is choice and random number
      choice : LN.Big_Unsigned;
      choiceAValue : LN.Big_Unsigned;
      choiceBValue : LN.Big_Unsigned;
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

      Alice.generateRandomsXY;

      -- Alice inputs x1 and Generates sequence X and sends it to Bob
      Put_Line("Alice input x1");
      x1 := LN.Utils.To_Big_Unsigned(Integer'Image(GetX));

      GenerateX(x1,Xarr, Big_to_Int(choice), choiceAValue );
      Put(Big_to_Int(choiceAValue));
      ArrUnsigned'Output(Channel , Xarr);

      --Alice sends Y to Bob
      LN.Big_Unsigned'Output (Channel, OT.computeY(choice, randomR));

      -- (Oblivious Transfer) Alice recieves C
     -- C := TwoDArray'Input(Channel);


      -- Alice computes M = a/b^r
      W := OT.RecieveMessage(TwoDArray'Input(Channel), choice, randomR);


      -- Alice inputs x1 and Generates sequence X and sends it to Bob
      Put_Line("Alice input  y1");
      y1 :=LN.Utils.To_Big_Unsigned(Integer'Image(GetY));

      GenerateY(y1, Yarr, Big_to_Int(choice), choiceBValue);
      ArrUnsigned'Output(Channel , Yarr);


      -- Alice computes M = a/b^r
      T := OT.RecieveMessage(TwoDArray'Input(Channel), choice, randomR);

      --

      -- Alice sends Sequence A

      Alice.SequenceT(choice, choiceAValue, Sarr);

      ArrUnsigned'Output(Channel , Sarr);
      -- alice recieves computed a from bob
     -- C3 := TwoDArray'Input(Channel);

    --  Put_Line("Chosen Sequence A is");
     -- New_Line;
       a:= OT.RecieveMessage(TwoDArray'Input(Channel), choice, randomR);

      -- Alice sends Sequence b
       Alice.SequenceT(choice, choiceBValue, Tarr);
      ArrUnsigned'Output(Channel , Tarr);

      -- alice recieves computed b from bob
      b := OT.RecieveMessage(TwoDArray'Input(Channel), choice, randomR);




      D := Alice.Distance(T , W, choiceAvalue, choiceBvalue
                    , a , b , LN.Utils.To_Big_Unsigned(Integer'Image(R))
                   ,x1 , y1);

     Put_Line("Distance is ");
     Put(LN.Utils.To_String(D));


   end Reciever;

end Client;
