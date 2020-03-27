pragma SPARK_Mode (On);


package body Nkires is
   
   
   
   procedure NkiresProc (N, K: in Integer; I, Res: out Integer) is
   
   begin
      I := 0;
      Res := 0;
      loop
         pragma Loop_Invariant (Res = I * K and I in 0 .. N -1 and N in 1 .. 1000);
	    I := I + 1;
	    Res := Res + K;
	    exit when I = N;
      end loop;
   end NkiresProc;

     
end Nkires;
     
     
   
     
   
