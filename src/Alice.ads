with Common, Ot; use Common, OT;

package Alice

is

   choiceA : Integer := 2;
   choiceA_value : Integer;
   choiceB : Integer := 2;
   choiceB_value : Integer;

   Function getX return Integer;

   Function getY return Integer;

   function randomA return XY_array;

   function randomB return XY_array;

   function storeA (a : Integer) return Integer;

   function GenerateX (X : Integer ) return XY_array;

   function GenerateY (Y : Integer) return XY_array;



   function SequenceS return XY_array;
   function SequenceT return XY_array;

 --  function Distance (T : Integer; W : Integer; choiceA: Integer;
   --                   choiceB: Integer; a : Integer; b : Integer; R: Integer;
     --                x1 : Integer; y1: Integer)
       --               return LN.Big_Unsigned;
end Alice;
