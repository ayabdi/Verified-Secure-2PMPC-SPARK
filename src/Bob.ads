
with Alice, OT , Common, Crypto.Types.Big_Numbers, Crypto.types; use Alice, OT , Common, Crypto.types;
package Bob
 with SPARK_Mode => Off
is

   use type LN.Big_Unsigned;
  -- function randomR return XY_array ;
   --function totalR (R : ArrUnsigned) return LN.Big_Unsigned with
 --   Global => Ln.Max_Length;
  -- Post => (for all K in Positive range R'Range  =>(totalR'Result >=  R(K)));

   function totalR (R : XY_array) return Integer;

   function GetX2 return Integer;
   function GetY2 return Integer;
   function ComputeT ( XYarr : ArrUnsigned; R : LN.Big_Unsigned ; XY2 : LN.Big_Unsigned) return ArrUnsigned;
    -- Depends => (ComputeT'Result => (R, XYarr, XY2, LN.Max_Length)) ,
     --Global => Ln.Max_Length,
    -- Pre => R > (+"0") and XY2 > (+"0"),
     --Post => (for all K in m range XYarr'Range => (ComputeT'Result(K) > (+"0")));

   function ComputeA ( XYarr : ArrUnsigned;  R : LN.Big_Unsigned ; XY2 : LN.Big_Unsigned) return ArrUnsigned;

end Bob;
