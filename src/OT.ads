with  Common;
with Ada.Text_IO, Ada.Command_Line, Crypto.Types.Big_Numbers;
pragma Elaborate_All(Crypto.Types.Big_Numbers);
package OT is

   --procedure RandomGen;
   package LN is new Crypto.Types.Big_Numbers (512);
     -- the actual number of bits has to be a multiple of 32
      use type LN.Big_Unsigned;
      use LN;
   use  LN.Utils;

   function "+"(S: String) return LN.Big_Unsigned
                renames LN.Utils.To_Big_Unsigned;

   type TwoDArray is
     array (Positive range <>, Positive range <>) of LN.Big_Unsigned;
   type ArrUnsigned is array(Positive range <>) of LN.Big_Unsigned;

   function computeY return LN.Big_Unsigned;
   function ComputeC (Y : LN.Big_Unsigned ; MG : ArrUnsigned)return TwoDArray;
   function KK return ArrUnsigned;
   function RecieveMessage (Z : TwoDArray; choice : LN.Big_Unsigned ) return LN.Big_Unsigned;
    function Distance (T : LN.Big_Unsigned; W : LN.Big_Unsigned; choiceA: LN.Big_Unsigned;
                      choiceB: LN.Big_Unsigned; a : LN.Big_Unsigned; b : LN.Big_Unsigned; R: LN.Big_Unsigned;
                     x1 : LN.Big_Unsigned; y1: LN.Big_Unsigned)
                      return LN.Big_Unsigned;

end OT;
