pragma SPARK_Mode (On);


package body Nkires is
   
   -- This procedureiterates I starting from 0 to N and in each step adds K to Res.

   procedure NkiresProc (N, K: in Integer; I, Res: out Integer) is
   
   begin
      I := 0;
      Res := 0;
      loop
         -- The loop invariant check if the following condition are true before every iteration.
         -- If Res is the multiple of I and K, if I is in the range of 0 to number of iterations minus one,
         -- if N is the range of 1 to 1000.
         pragma Loop_Invariant (Res = I * K and I in 0 .. N -1 and N in 1 .. 1000);
            -- Every iteration I is added by one
            I := I + 1;
            -- Adds K to Res and becomes the new value Res
            Res := Res + K;
            -- When I is equal the to the given input of N then the loop will exit.
	    exit when I = N;
      end loop;
   end NkiresProc;
 
end Nkires;
     
     
   
     
   
