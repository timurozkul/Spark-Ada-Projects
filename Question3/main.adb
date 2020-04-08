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

with AS_IO_Wrapper; 
use AS_IO_Wrapper; 
with Power_Grid_Energy_Stabilizer;
use Power_Grid_Energy_Stabilizer;

procedure Main is
   Last : Integer;
   User_Input : String(1 .. 20);
begin
   AS_Init_Standard_Output;
   AS_Init_Standard_Input; 
   Print_Welcome;
   Init;
   loop
      pragma Loop_Invariant (Is_Safe);
      Read_Consumption;
      Read_Supply;
      Energy_Stabilizerg_System;
      Print_Status;
      Refill_Reserve;
      loop
	As_Put("Do you want to exit (y/n)? ");
	As_Get_Line(User_Input, Last);
	exit when Last > 0;
	As_Put_Line("Please enter a non-empty string");
      end loop;
     exit when User_Input(1 .. 1) = "y";
   end loop;
end Main;
      
      



