with Ada.Text_Io, Alice, Common;
use Ada.Text_Io, Alice, Common;
with Ada.Numerics.discrete_Random;
with Ada.Text_IO, Ada.Command_Line, Crypto.Types.Big_Numbers;
pragma Elaborate_All(Crypto.Types.Big_Numbers);

package body OT is

   p : Integer := 5;
 --  h : Integer := 2;
   --g : Integer := 5;

   --Reciever

   -- reciever random r and choice 'a'
   --r : Integer := 1;
 --  a : Integer := 2;

   h : LN.Big_Unsigned := LN.Utils.To_Big_Unsigned("2");
   g : LN.Big_Unsigned := LN.Utils.To_Big_Unsigned("5");
   r : LN.Big_Unsigned := LN.Utils.To_Big_Unsigned("5");
   a : LN.Big_Unsigned := LN.Utils.To_Big_Unsigned("2");

function RandomGen return Integer is
   package Rand_Int is new ada.numerics.discrete_random(Rand_Range);
   seed : Rand_Int.Generator;
   Num : Rand_Range;
begin
   Rand_Int.Reset(seed);
   Num := Rand_Int.Random(seed);
   return Num;
 end;


  -- generators h and g


   -- reciever compute Y = g^r * h^a

   function computeY return LN.Big_Unsigned is
      Y : LN.Big_Unsigned;
   begin
      Y := (g**r) * (h**a);
      return Y;
   end;

   -- Sender
   -- messages
  function messages return ArrUnsigned is
      Message : ArrUnsigned(m);
   begin
      Message := (To_Big_Unsigned("4345234"),To_Big_Unsigned("23458"),To_Big_Unsigned("23454"));
      return Message;
  end;

   -- random k
   function KK return ArrUnsigned is
      K :  ArrUnsigned(m);
   begin
      K := (To_Big_Unsigned("4"),To_Big_Unsigned("3"),To_Big_Unsigned("7"));

      return K;
  end;


   function ComputeC (Y : LN.Big_Unsigned ; MG : ArrUnsigned)return TwoDArray is
     Z: TwoDArray(m,1..2);
     v : LN.Big_Unsigned;
     w : LN.Big_Unsigned;
   begin
     for I in Z'Range loop
         w := g ** KK(I);
        -- Put(w);
         v := MG(I) * ((Y/(h**To_Big_Unsigned(Integer'Image(I)))) ** KK(I));
         Z(I,1) := w;
         Z(I,2) := v;
      end loop;
      --Put_Line("Final result");
         return Z;
   end ComputeC;

   function RecieveMessage (Z : TwoDArray; choice : LN.Big_Unsigned ) return LN.Big_Unsigned is
   begin
      return
         Z(Integer'Value(LN.Utils.To_String(choice)),2)/ (Z(Integer'Value(LN.Utils.To_String(a)),1) ** r);
   end;

end OT;
