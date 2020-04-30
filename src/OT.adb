with Ada.Text_Io, Alice, Common;
use Ada.Text_Io, Alice, Common;
with Ada.Numerics.discrete_Random;
with Ada.Text_IO, Ada.Command_Line, Crypto.Types.Big_Numbers;
pragma Elaborate_All(Crypto.Types.Big_Numbers);

package body OT  is

   --base p
   p :  LN.Big_Unsigned := +("1565135459");

   --generators
   h : LN.Big_Unsigned := +("507035423");
   g : LN.Big_Unsigned := +("5");



   -- reciever compute Y = g^r * h^a

   function computeY (a : LN.Big_Unsigned ; r : LN.Big_Unsigned)  return LN.Big_Unsigned is
      Y : LN.Big_Unsigned;
   begin
      Y := LN.Mod_Utils.Pow(g,r,p) * LN.Mod_Utils.Pow(h,a,p);
      return Y;
   end;



   -- random k (not random yet)
   function KK return ArrUnsigned is
      K :  ArrUnsigned(m);
   begin
      K := (+("4"),+("3"), +("7"));

      return K;
  end;


   function ComputeC (Y : LN.Big_Unsigned; MG : ArrUnsigned )return TwoDArray is
     Z: TwoDArray(m,1..2);
     v : LN.Big_Unsigned;
     w : LN.Big_Unsigned;
   begin
     for I in Z'Range loop
         w := LN.Mod_Utils.Pow(g ,KK(I),p);

        -- Put(w);
         v := MG(I) * LN.Mod_Utils.Pow((Y/(LN.Mod_Utils.Pow(h,To_Big_Unsigned(Integer'Image(I)),p))) , KK(I), p);
         Z(I,1) := w;
         Z(I,2) := v;
      end loop;

        return Z;
   end ComputeC;


   function RecieveMessage (Z : TwoDArray; choice : LN.Big_Unsigned ; r : LN.Big_Unsigned) return LN.Big_Unsigned is
      X : Ln.Big_Unsigned;
      Y : Ln.Big_Unsigned;
   begin
    --  Put(LN.Utils.To_String(choice));
      X := Z(Integer'Value(LN.Utils.To_String(choice)),2);
      Y := Z(Integer'Value(LN.Utils.To_String(choice)),1);
      return
        X/LN.Mod_Utils.Pow(Y , r , p);
   end;


end OT;
