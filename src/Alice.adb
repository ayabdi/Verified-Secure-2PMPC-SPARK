
with Ada.Text_Io;use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random, OT, Random; use Random , OT;

package body Alice

is


Function getX return Integer is
      x1 : Integer;
   begin
      Get (x1);
   return x1;
   end getX;


Function getY return Integer is
      y1 : Integer;
   begin
      Get(y1);
      return y1;
   end getY;

  function setChoice return LN.Big_Unsigned is
     a : Integer;

  begin
      Get(a);
      return LN.Utils.To_Big_Unsigned(Integer'Image(a));
   end;



   function GenerateX (X : LN.Big_Unsigned ; choice : LN.Big_Unsigned) return ArrUnsigned is
      Arr : ArrUnsigned (m);
      R : LN.Big_Unsigned ;
      use type LN.Big_Unsigned;
   begin

      for I in Arr'Range loop
         R := LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen));
         if LN.Utils.To_Big_Unsigned(Integer'Image(I)) = choice then
            Arr(I) := X + R;
            Alice.choiceA_value := R;
         else
            Arr(I) := X + R;
         end if;
      end loop;

      return Arr;
   end GenerateX;

   function storeA (a : Integer) return Integer is
      x : Integer;
      begin
         X:=a;
         return x;
      end;


   function GenerateY(Y : LN.Big_Unsigned ; choice : LN.Big_Unsigned) return ArrUnsigned is
      Arr : ArrUnsigned (m);
      R : LN.Big_Unsigned ;
      use type LN.Big_Unsigned;
   begin

      for I in Arr'Range loop
         R := LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen));
         if LN.Utils.To_Big_Unsigned(Integer'Image(I)) = choice then
            Arr(I) := Y + R;
            Alice.choiceB_value := R;
         else
            Arr(I) := Y + R;
         end if;
      end loop;
      return Arr;
   end GenerateY;


   function SequenceS (choice : LN.Big_Unsigned) return ArrUnsigned is
      Arr : ArrUnsigned(m);
        use type LN.Big_Unsigned;
   begin
      for I in Arr'Range loop
        -- R := LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen));

         if LN.Utils.To_Big_Unsigned(Integer'Image(I)) = choice then
            Arr(I) := Alice.choiceA_value;
           -- New_Line;
          --  Put_Line("Sequence S choice a is ");
           -- Put(Arr(I));
         else
            Arr(I) := LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen)) ;
        end if;
         end loop;

      return Arr;
  end SequenceS;

  function SequenceT (choice : LN.Big_Unsigned) return ArrUnsigned is
      Arr : ArrUnsigned(m);
        use type LN.Big_Unsigned;
   begin
      for I in Arr'Range loop

         if LN.Utils.To_Big_Unsigned(Integer'Image(I)) = choice then
            Arr(I) := Alice.choiceB_value;
           -- New_Line;
          --  Put_Line("Sequence S choice a is ");
           -- Put(Arr(I));
         else
            Arr(I) := LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen)) ;
        end if;
      end loop;
      return Arr;
   end SequenceT;

   function Distance (T , W , choiceA, choiceB, a , b, R , x1, y1 : LN.Big_Unsigned)
                      return LN.Big_Unsigned is
      D : Ln.Big_Unsigned;
      Two : LN.Big_Unsigned ;
      use type LN.Big_Unsigned;
   begin
      Two := +("2");
      D := (T + W  - (choiceA ** Two) - (choiceB ** Two) - (Two*choiceA*x1) - (Two*choiceB*y1) + a + b - R);
      return D;
   end Distance;



end Alice;
