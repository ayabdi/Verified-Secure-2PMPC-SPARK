
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


   function randomR return XY_array is
      Arr :  XY_array(m) ;
   begin
      for I in Arr'Range loop
         Arr(I) := Random.RandonGen;
      end loop;
      return Arr;
   end randomR;

   function ComputeT ( XYarr : XY_array; R : Rand_Range ; XY2 : Integer) return ArrUnsigned is
      Arr : ArrUnsigned (m);

   begin
      for I in XYarr'Range loop
         --Put_Line("Beginn");
         Arr(I) := LN.Utils.To_Big_Unsigned(Integer'Image(((XYarr(I) - XY2)**2) + RandomR(R)));
       --  Put_Line(" T is " );       --
      end loop;
      --Put(Arr(2));
    --  New_Line;
      return Arr;
   end ComputeT;








end Bob;
