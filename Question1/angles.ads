pragma SPARK_Mode (On);

package Angles is
   subtype angle is Integer range 0 .. 359;

   function AddAngles2(X, Y : in angle) return angle with
     Post => (X + Y = AddAngles2'Result) or (X + Y - 360 = AddAngles2'Result);

  procedure AddAngles(X, Y : in angle; U: out angle)
     with Depends => (U => (X, Y)),
     Post => (X + Y = U) or (X + Y - 360 = U);

end Angles;

