
with Ada.Text_Io;use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.discrete_Random, OT, Random; use Random , OT;

package body Alice
  with SPARK_Mode => On
is

   XArr : ArrUnsigned ;
   YArr: ArrUnsigned;
  -- Sarr: ArrUnsigned;
   Tarr : ArrUnsigned;

   procedure generateRandomsXY
     with SPARK_Mode => OFf is
 begin
      for I in Xarr'Range loop
         Xarr(I) :=LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen));
         Yarr(I) :=LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen));
      end loop;
      New_Line;
            Put (LN.Utils.To_String(Yarr(2)));
            New_Line;
   end;




   Function getX return Integer
    with SPARK_Mode => OFf is
      x1 : Integer;
   begin
      Get (x1);
   return x1;
   end getX;


Function getY return Integer with SPARK_Mode => OFf is
      y1 : Integer;
   begin
      Get(y1);
      return y1;
   end getY;

   function setChoice return LN.Big_Unsigned with SPARK_Mode => OFf
   is
     a : Integer;

  begin
      Get(a);
      return LN.Utils.To_Big_Unsigned(Integer'Image(a));
   end;



 procedure GenerateX(X : in LN.Big_Unsigned;  Arr : out ArrUnsigned ;  choice : in Integer ;  Value : out LN.Big_Unsigned  )  is

      use type LN.Big_Unsigned;
   begin

      for I in XArr'Range loop
         if I = choice then
            value := XArr(choice);
            Arr(I) := X + XArr(I);

         else
            Arr(I) := X + XArr(I);
         end if;

      end loop;

   end GenerateX;

   function storeA (a : Integer) return Integer is
      x : Integer;
      begin
         X:=a;
         return x;
      end;


   procedure GenerateY(Y : in LN.Big_Unsigned;  Arr : out ArrUnsigned ;  choice : in Integer ;  Value : out LN.Big_Unsigned )  is

      use type LN.Big_Unsigned;
   begin

      for I in YArr'Range loop
         if I = choice then
            value := YArr(choice);
            Arr(I) := Y + YArr(I);

         else
            Arr(I) := Y + YArr(I);
         end if;

      end loop;

   end GenerateY;


   procedure SequenceS ( choice : in LN.Big_Unsigned;
                         value : in  LN.Big_Unsigned ;
                         Sarr : out ArrUnsigned)
   with SPARK_Mode => Off  is
      use type Ln.Big_Unsigned;
   begin
      for I in Sarr'Range loop
         if LN.Utils.To_Big_Unsigned(Integer'Image(I)) = choice then
            Sarr(I) := value;
            --value := Sarr(I);
         else
             Sarr(I) :=LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen));

         end if;
      end loop;
     -- return SArr;
  end SequenceS;

    procedure SequenceT ( choice : in LN.Big_Unsigned;
                         value : in  LN.Big_Unsigned ;
                          Tarr : out ArrUnsigned)
     with SPARK_Mode => Off
     is
      use type Ln.Big_Unsigned;
   begin
      for I in Tarr'Range loop
         if LN.Utils.To_Big_Unsigned(Integer'Image(I)) = choice then
            Tarr(I) := value;
            --value := Sarr(I);
         else
             Tarr(I) :=LN.Utils.To_Big_Unsigned(Integer'Image(Random.RandomGen));

         end if;
      end loop;
     -- return SArr;
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
