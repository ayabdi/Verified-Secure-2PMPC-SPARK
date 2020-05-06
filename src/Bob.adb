
with Ada.Text_Io, Alice, OT, Random;
use Ada.Text_Io, Alice, Random;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random;

package body Bob
  with SPARK_Mode => Off

is

   ---Sender
   function GetX2 return Integer
     with SPARK_Mode => Off
   is
       x2 : Integer;
   begin
       Get (x2);
   return x2;
end GetX2;

   function GetY2 return Integer
     with SPARK_Mode => Off
   is
       y2 : Integer;
   begin
      Get (y2);
   return y2;
   end getY2;



   --function totalR (R : ArrUnsigned) return LN.Big_Unsigned is
    --  Total : LN.Big_Unsigned := +("0");

  -- begin
     -- for  I in Positive range  R'Range loop
        -- pragma Loop_Invariant(for all K in R'First .. I-1  =>(Total >=  R(K)));
       --  Total := Total + R(I);
     -- end loop;
     -- return Total;
  ---- end totalR;

   function totalR (R : XY_array) return Integer is
      Total : Integer;
   begin
      for I in R'Range loop
         Total := Total + R(I);
      end loop;
      return Total;
   end totalR;


   function ComputeT ( XYarr : ArrUnsigned; R : LN.Big_Unsigned ; XY2 : LN.Big_Unsigned) return ArrUnsigned is
      Arr : ArrUnsigned;
      Two : Ln.Big_Unsigned;
      use type LN.Big_Unsigned;
   begin
      Two := +("2");
      for I in Arr'Range loop
         --Put_Line("Beginn");
         Arr(I) := ((XYarr(I) - XY2)**Two) + R;
        -- Put_Line(" T is " );
      end loop;

      return Arr;
   end ComputeT;

-- Computes a = (2a * x2) + 3
   function ComputeA (XYarr : ArrUnsigned; R : LN.Big_Unsigned ; XY2 : LN.Big_Unsigned) return ArrUnsigned is
       Arr : ArrUnsigned;
       Two : Ln.Big_Unsigned;
      use type LN.Big_Unsigned;
   begin
      Two := +("2");
      for I in XYarr'Range loop

        Arr(I) := (Two * (XYarr(I)) * XY2) + R;
        --
      end loop;

      return Arr;
   end ComputeA;





end Bob;
