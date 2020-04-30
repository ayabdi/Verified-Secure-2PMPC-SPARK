
with Alice, OT , Common; use Alice, OT , Common;
package Bob

is



  -- function randomR return XY_array ;
   function totalR (R : XY_array) return Integer;
   function GetX2 return Integer;
   function GetY2 return Integer;
   function ComputeT ( XYarr : ArrUnsigned; R : Rand_Range ; XY2 : Integer) return ArrUnsigned;
   function ComputeA ( XYarr : ArrUnsigned; R : Rand_Range ; XY2 : Integer) return ArrUnsigned;

end Bob;
