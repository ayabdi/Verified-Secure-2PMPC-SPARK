with Common, Ot; use Common, OT;

package Alice

is



   Function getX return Integer;

   Function getY return Integer;

   function randomA return XY_array;

   function randomB return XY_array;

   function GenerateX (X : Integer) return XY_array;

   function GenerateY (Y : Integer) return XY_array;



   function SequenceS(A : Rand_Range) return XY_array;
   function SequenceT(A : Rand_Range) return XY_array;
end Alice;
