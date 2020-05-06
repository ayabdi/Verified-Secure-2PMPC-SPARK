with  Common; use Common;
with Ada.Text_IO, Ada.Command_Line, Crypto.Types.Big_Numbers, Crypto.types; use Crypto.Types;
pragma Elaborate_All(Crypto.Types.Big_Numbers);

package OT  is

   --procedure RandomGen;

     -- the actual number of bits has to be a multiple of 32
   use type LN.Big_Unsigned;

      use LN;
   use  LN.Utils;

   function "+"(S: String) return LN.Big_Unsigned
                renames LN.Utils.To_Big_Unsigned;




   type TwoDArray is
     array (Positive range <>, Positive range <>) of LN.Big_Unsigned;
   type ArrUnsigned is array(m) of LN.Big_Unsigned;

   function Int_to_Big (N : Integer) return LN.Big_Unsigned;
   function Big_to_Int (N : LN.Big_Unsigned) return Integer;

   function computeY (a : LN.Big_Unsigned ; r : LN.Big_Unsigned)  return LN.Big_Unsigned;
   function ComputeC (Y : LN.Big_Unsigned ; MG : ArrUnsigned)return TwoDArray;
   function KK return ArrUnsigned;
   --function message return ArrUnsigned;
   function RecieveMessage (Z : TwoDArray; choice : LN.Big_Unsigned ; r : LN.Big_Unsigned) return LN.Big_Unsigned;


end OT;
