pragma SPARK_Mode (On);
package Nkires is

  -- type N is new Integer range 1 .. 1000;

   procedure NkiresProc(N, K: in Integer; I, Res: out Integer)
     with Depends => (Res => (K, N), I => N),
          Pre => (N in 1 .. 1000 and K in 0 .. 1000),
          Post => (N * K = Res and N = I);

end Nkires;
