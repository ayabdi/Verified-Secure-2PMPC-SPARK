with Common, Ot; use Common, OT;

package Alice
  with SPARK_Mode => on
is


   choiceA_value :  LN.Big_Unsigned;
   choiceB_value : LN.Big_Unsigned;

   procedure generateRandomsXY;


   Function getX return Integer;

   Function getY return Integer;

   function setChoice return LN.Big_Unsigned;

 --  function randomA return XY_array;

  -- function randomB return XY_array;

   function storeA (a : Integer) return Integer;

   procedure GenerateX( X : in LN.Big_Unsigned;  Arr : out ArrUnsigned ;  choice : in Integer ;  Value : out LN.Big_Unsigned ) ;

   procedure GenerateY ( Y : in LN.Big_Unsigned;  Arr : out ArrUnsigned ;  choice : in Integer ;  Value : out LN.Big_Unsigned );



   procedure SequenceS ( choice :in LN.Big_Unsigned;
                        value : in LN.Big_Unsigned ;
                         Sarr : out ArrUnsigned) ;
   procedure SequenceT ( choice :in LN.Big_Unsigned;
                        value : in LN.Big_Unsigned ;
                         Tarr : out ArrUnsigned) ;
 function Distance (T , W , choiceA, choiceB, a , b, R , x1, y1 : LN.Big_Unsigned)
                      return LN.Big_Unsigned;
end Alice;
