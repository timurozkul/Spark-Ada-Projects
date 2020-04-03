-- this is the executable file 
-- running the energy stabilizer for a power grid system
--
-- it initialises the system
-- then runs for ever in a loop which
--   1) reads the temperature from console
--   2) monitors the cooling system so that the cooling
--      system is activated if the temperature is too shigh
--   3) prints out the status
-- 
--  the loop_invariant expresses that the system stays safe all the time.

pragma SPARK_Mode (On);

with Power_Grid_Energy_Stabilizer;
use Power_Grid_Energy_Stabilizer;


procedure Main
is
begin
   Init;
   loop
      pragma Loop_Invariant (Is_Safe);
      Read_Consumption;
      Read_Supply;
      Energy_Stabilizerg_System;
      Print_Status;
      Refill_Reserve;
   end loop;
end Main;
      
      
