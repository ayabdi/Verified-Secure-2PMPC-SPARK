with Ada.Numerics.discrete_Random, Common; use Common;

package body Random with SPARK_Mode => Off is

    pragma Compile_Time_Warning
     (True, "This PRNG is not cryptographically secure.");

   package Rand_Int is new ada.numerics.discrete_random(Rand_Range);
   seed : Rand_Int.Generator;
   Num : Rand_Range;

   function RandomGen return Integer is
    begin
        Rand_Int.Reset(seed);
        Num := Rand_Int.Random(seed);
   return Num;
 end;

end Random;
