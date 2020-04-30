
with Ada.Text_Io, Alice, OT, Random;
use Ada.Text_Io, Alice, Random;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random;

package body Bob

is

   ---Sender
 function GetX2 return Integer is
       x2 : Integer;
   begin
       Get (x2);
   return x2;
end GetX2;

 function GetY2 return Integer is
       y2 : Integer;
   begin
      Get (y2);
   return y2;
   end getY2;


   function totalR (R : XY_array) return Integer is
      Total : Integer;
   begin
      for I in R'Range loop
         Total := Total + R(I);
      end loop;
      return Total;
   end totalR;



   function ComputeT ( XYarr : ArrUnsigned; R : Rand_Range ; XY2 : Integer) return ArrUnsigned is
      Arr : ArrUnsigned (m);

   begin
      for I in XYarr'Range loop
         --Put_Line("Beginn");
         Arr(I) := LN.Utils.To_Big_Unsigned(Integer'Image(((Integer'Value(LN.Utils.To_String(XYarr(I))) - XY2)**2) + R));
        -- Put_Line(" T is " );
      end loop;

      return Arr;
   end ComputeT;

-- Computes a = (2a * x2) + 3
   function ComputeA (XYarr : ArrUnsigned; R : Rand_Range ; XY2 : Integer) return ArrUnsigned is
       Arr : ArrUnsigned (m);

   begin
      for I in XYarr'Range loop

        Arr(I) := LN.Utils.To_Big_Unsigned(Integer'Image((2 * Integer'Value(LN.Utils.To_String(XYarr(I))) * XY2) + R));
        --
      end loop;

      return Arr;
   end ComputeA;





end Bob;
