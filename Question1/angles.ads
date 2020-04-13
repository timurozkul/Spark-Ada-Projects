pragma SPARK_Mode (On);

package Angles is
   subtype angle is Integer range 0 .. 359;
   -- This AddAngles procedure takes in two angles as input and gives the sum
   procedure AddAngles(X, Y : in angle; U: out angle)
     with Depends => (U => (X, Y)),
     Post => (X + Y = U) or (X + Y - 360 = U);

   -- This AddAngles function takes in two angles as input and returns the sum
   function AddAngles2(X, Y : in angle) return angle with
     Post => (X + Y = AddAngles2'Result) or (X + Y - 360 = AddAngles2'Result);

end Angles;

