pragma SPARK_Mode (On);
package Nkires is

   -- This procedureiterates I starting from 0 to N and in each step adds K to Res.

   procedure NkiresProc(N, K: in Integer; I, Res: out Integer)
     -- Res depends on the input K and N.
     -- I depends on N
     -- The precondition that N is in the range of 1 to 1000 and K inn the range
     -- of 1 to 1000 must be true
     -- The post condition must be that Res must be the multiple of N and K and
     -- that N is equal to I
     with Depends => (Res => (K, N), I => N),
          Pre => (N in 1 .. 1000 and K in 0 .. 1000),
          Post => (N * K = Res and N = I);

end Nkires;
