
with Ada.Text_Io;
use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random;
with Client;
package body Alice

is


function RandomGen return Integer is
   package Rand_Int is new ada.numerics.discrete_random(Rand_Range);
   seed : Rand_Int.Generator;
   Num : Rand_Range;
begin
   Rand_Int.Reset(seed);
   Num := Rand_Int.Random(seed) ;

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
         if I = Alice.choiceA then
            Arr(I) := RandomGen;
           Alice.choiceA_value := Arr(I);
         else
            Arr(I) := RandomGen;
         end if;

      end loop;
      return Arr;
   end randomA;

   function randomB return XY_array is
      Arr : XY_array(m) ;
   begin
     for I in Arr'Range loop
         Arr(I) := RandomGen;
          if I = Alice.choiceB then
            Alice.choiceB_value := Arr(I);
         end if;
     end loop;
     return Arr;
   end randomB;

   function GenerateX (X : Integer) return XY_array is
      Arr : XY_array (m);
      Random : Integer ;
   begin

      for I in Arr'Range loop
         Random := RandomGen;
      --   Put_Line(" 1st random = ");
      --   Put(Random);
         if I = Alice.choiceA then
            Arr(I) := X + Random;
            Alice.choiceA_value := Random;
      --      Put_Line("random = ");
      --      Put(Random);
         else
            Arr(I) := X + Random;


         end if;

       --  Put_Line("Generate X result");
         --Put(Arr(I));
      end loop;

      return Arr;
   end GenerateX;

   function storeA (a : Integer) return Integer is
      x : Integer;
      begin
         X:=a;
         return x;
      end;


   function GenerateY(Y : Integer) return XY_array is
      Arr : XY_array (m);
      Random : Integer;
   begin

      for I in Arr'Range loop
         Random := RandomGen;
       --  Put_Line(" 1st random = ");
         --Put(Random);
         if I = Alice.choiceB then
            Arr(I) := Y + Random;
            Alice.choiceB_value := Random;
       --     Put_Line("random = ");
         --   Put(Random);
         else
            Arr(I) := Y + Random;
         end if;

       --  Put_Line("Generate X result");
         --Put(Arr(I));
      end loop;


      return Arr;
   end GenerateY;


   function SequenceS return XY_array is
      Arr : XY_array(m);
   begin
      for I in Arr'Range loop
         if I = Alice.choiceA then
            Arr(I) := Alice.choiceA_value;
            New_Line;
        --    Put_Line("Sequence S choice a is ");
          --  Put(Arr(I));
         else
            Arr(I) := RandomGen;
         end if;
         end loop;

      return Arr;
   end SequenceS;

  function SequenceT return XY_array is
      Arr : XY_array(m);
   begin
      for I in Arr'Range loop
         if I = Alice.choiceB then
            Arr(I) := Alice.choiceB_value;
           -- Put(Arr(I));
         else
            Arr(I) := RandomGen;
         end if;
      end loop;
      return Arr;
   end SequenceT;

 -- function Distance (T : Integer; W : Integer; choiceA: Integer;
    --                  choiceB: Integer; a : Integer; b : Integer ;R: Integer;
      ---               x1 : Integer; y1: Integer)
         --             return LN.Big_Unsigned is
     -- D : Ln.Big_Unsigned;
      --Two : LN.Big_Unsigned ;
      --SQRT : LN.Big_Unsigned ;
   --begin
     -- Two := To_Big_Unsigned("2");
      --SQRT := To_Big_Unsigned("0.5");

     -- D := LN.Utils.To_Big_Unsigned(Integer'Image(T + W  - (Alice.choiceA_value ** 2) - (choiceB_value ** 2) - (2*choiceA_value*x1) - (2*choiceB_value*y1) + a + b - R));
     -- return D;
  -- end Distance;



end Alice;
