
with Ada.Text_IO, Ada.Command_Line, Crypto.Types.Big_Numbers;
pragma Elaborate_All(Crypto.Types.Big_Numbers);
package Common is


   subtype Rand_Range is Integer range 1..1500;
   subtype m is Integer range 1..3;
   type XY_array is array (Integer range <>) of Integer;

   -- Serve/Client Port
   Port : constant := 8484;

end Common;
