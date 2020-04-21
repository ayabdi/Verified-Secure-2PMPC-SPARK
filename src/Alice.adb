
with Ada.Text_Io;
use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random;

package body Alice

is

function RandomGen return Integer is
   package Rand_Int is new ada.numerics.discrete_random(Rand_Range);
   seed : Rand_Int.Generator;
   Num : Rand_Range;
begin
   Rand_Int.Reset(seed);
   Num := Rand_Int.Random(seed);


   return Num;
   end RandomGen;

Function getX return Integer is
      x1 : Integer;
   begin
      Get (x1);
   return x1;
   end getX;


Function getY return Integer is
      y1 : Integer;
   begin
      Get(y1);
      return y1;
 end getY;



   function randomA return XY_array is
      Arr :  XY_array(m) ;
   begin
      for I in Arr'Range loop
         Arr(I) := RandomGen;
      end loop;
      return Arr;
   end randomA;

   function randomB return XY_array is
      Arr : XY_array(m) ;
   begin
     for I in Arr'Range loop
         Arr(I) := RandomGen;
     end loop;
     return Arr;
   end randomB;

   function GenerateX (X : Integer) return XY_array is
      Arr : XY_array (m);
   begin
      for I in Arr'Range loop
         Arr(I) := X + randomA(I);
       --  Put_Line("Generate X result");
         --Put(Arr(I));
      end loop;

      return Arr;
   end GenerateX;

   function GenerateY(Y : Integer) return XY_array is
      Arr : XY_array (m);
   begin
      for I in Arr'Range loop
         Arr(I) := Y + randomB(I);
        -- Put_Line("Generate Y result");
        -- Put(Arr(I));

      end loop;

      return Arr;
   end GenerateY;


   function SequenceS(A : Rand_Range) return XY_array is
      Arr : XY_array(m);
   begin
      Arr := (5,10,A);
      return Arr;
   end SequenceS;

    function SequenceT(A : Rand_Range) return XY_array is
      Arr : XY_array(m);
   begin
      Arr := (5,10,A);
      return Arr;
   end SequenceT;



end Alice;
