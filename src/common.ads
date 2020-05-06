
with Ada.Text_IO, Ada.Command_Line, Crypto.Types.Big_Numbers;
pragma Elaborate_All(Crypto.Types.Big_Numbers);
package Common is


   subtype Rand_Range is Integer range 0..150000;

   subtype m is Integer range 1..3;
   type XY_array is array (Positive range <>) of Rand_Range;

   package LN is new Crypto.Types.Big_Numbers(512);


   -- Serve/Client Port
   Port : constant := 8484;

end Common;
