
with Alice, OT , Common; use Alice, OT , Common;
package Bob

is


   function randomR return XY_array ;
   function GetX2 return Integer;
   function GetY2 return Integer;
   function ComputeT ( XYarr : XY_array; R : Rand_Range ; XY2 : Integer) return ArrUnsigned;

end Bob;
