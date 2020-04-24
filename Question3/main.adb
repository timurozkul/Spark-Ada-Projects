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

--with AS_IO_Wrapper; 
--use AS_IO_Wrapper; 
with Power_Grid_Energy_Stabilizer;
use Power_Grid_Energy_Stabilizer;
with Global_Variables; 
use Global_Variables;

procedure Main is
 
begin 
   -- The Init procedure is used to initialise the program
   Init;
    -- This is simply a welcome print out
   Print_Welcome;
   loop
      pragma Loop_Invariant (Status_System.Consumption_Measured <= Status_System.Supplied_Measured 
                             AND Status_System.Status_Reserved_Electricity = Not_Activated);

      -- Takes in an input for the  consumption of energy
      Read_Consumption;
      -- Takes in an input for the current supply of energy
      Read_Supply;
      -- This is where most the logic lies for stabilizing the system
      Energy_Stabilizerg_System;
      -- Prints the current state of the system
      Print_Status;
      -- Refills the battery reserve if necessary
      Refill_Reserve;
      -- This loop is used to exit the program
   end loop;
end Main;
      
      


