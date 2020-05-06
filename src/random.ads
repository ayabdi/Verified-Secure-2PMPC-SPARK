with Ada.Numerics.discrete_Random;

package Random with SPARK_Mode => Off is

   function RandomGen return Integer;
end;
