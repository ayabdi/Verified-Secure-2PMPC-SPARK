with Ada.Numerics.discrete_Random;

package body Random is

function RandonGen return Integer is
   package Rand_Int is new ada.numerics.discrete_random(Rand_Range);
   seed : Rand_Int.Generator;
   Num : Rand_Range;
begin
   Rand_Int.Reset(seed);
   Num := Rand_Int.Random(seed);
   return Num;
 end;

end Random;
