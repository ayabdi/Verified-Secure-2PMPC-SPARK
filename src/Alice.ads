with Common, Ot; use Common, OT;

package Alice

is


   choiceA_value :  LN.Big_Unsigned;
   choiceB_value : LN.Big_Unsigned;

   Function getX return Integer;

   Function getY return Integer;

   function setChoice return LN.Big_Unsigned;

 --  function randomA return XY_array;

  -- function randomB return XY_array;

   function storeA (a : Integer) return Integer;

   function GenerateX(X : LN.Big_Unsigned ; choice : LN.Big_Unsigned) return ArrUnsigned ;

   function GenerateY(Y : LN.Big_Unsigned ; choice : LN.Big_Unsigned) return ArrUnsigned ;



   function SequenceS (choice : LN.Big_Unsigned) return ArrUnsigned;
   function SequenceT (choice : LN.Big_Unsigned) return ArrUnsigned;

 function Distance (T , W , choiceA, choiceB, a , b, R , x1, y1 : LN.Big_Unsigned)
                      return LN.Big_Unsigned;
end Alice;
