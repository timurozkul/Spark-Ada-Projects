-- This file was created by Timur Ozkul
-- it is an ultra simple example of a critical system
-- namely a energy stabilizer for a power grid.
-- If the consumption for the energy gets to a critical level 
-- then the necessary is extra electricity is taken from its 
-- storage facilicty.

pragma SPARK_Mode (On);

with SPARK.Text_IO;use  SPARK.Text_IO;
with Global_Variables; use Global_Variables;

package Power_Grid_Energy_Stabilizer is
   
   -- Average home consumption is 11 kw per day 
   -- .13 watts per second is GW 0.000011
   -- Power grid system supplies 3.2 million homes in Wales 
   -- with an average energy consumption of 416,000 watts (416 kw) per second
   
   
   --Maximum_Electricity_Possible : Maximum_Electricity_Possible;
   --Maximum_Reserved_Electricity_Possible : Maximum_Reserved_Electricity_Possible;
   --Critical_Reserve_level : Critical_Reserve_level;

   --Electricity_Range : Electricity_Range;
   --Reserve_Electricity_Range : Reserve_Electricity_Range;

   --Status_Reserved_Electricity_Type : Status_Reserved_Electricity_Type;

   --Status_System : Status_System_Type;
  
   procedure Init with
     Global => (Output => (Standard_Output,Standard_Input,Status_System)),
     Depends => ((Standard_Output,Standard_Input,Status_System) => null),
     Post => ((Status_System.Consumption_Measured = 0) AND
     (Status_System.Supplied_Measured = 0) AND
     (Status_System.Reserved_Measured = Maximum_Reserved_Electricity_Possible) AND
     (Status_System.Status_Reserved_Electricity = Not_Activated));
   
    procedure Print_Welcome with
     Global => (In_Out => Standard_Output),
     Depends => (Standard_Output => Standard_Output);
   
   -- function Is_Safe return Boolean is
   --   (if Integer(Status_System.Reserved_Measured) > Critical_Reserve_level 
	--      then Status_System.Status_Reserved_Electricity = Activated
   --           else Status_System.Status_Reserved_Electricity = Not_Activated);
   
   procedure Read_Consumption with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output, Standard_Input),
                 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
   
   
    procedure Read_Supply with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output, Standard_Input),
		 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
   
   procedure Energy_Stabilizerg_System  with
     Global => (In_Out => (Status_System, Standard_Output)),              
     Depends => (Status_System => (Status_System),
                 Standard_Output => (Standard_Output, Status_System)),
     Post => (Status_System.Consumption_Measured <= Status_System.Supplied_Measured); 
   
   -- Print Status prints out the status of the system on console
   procedure Print_Status with
     Global => (In_Out => (Standard_Output),
                Input => Status_System),
     Depends => (Standard_Output => ( Standard_Output,Status_System));
    -- Post => (Status_System.Consumption_Measured <= Status_System.Supplied_Measured);
   
    function Status_Electricity_System_To_String return String;
   -- Global => (Input => Status_System);
   
   procedure Print_Reserve_levels with
     Global => (In_Out => Standard_Output,
                Input => Status_System),
     Depends => (Standard_Output => (Standard_Output, Status_System));
   
   procedure Refill_Reserve with
     Global => (In_Out => (Standard_Input, Standard_Output, Status_System)),
     Depends => (Status_System => (Status_System, Standard_Input),
                 Standard_Input => (Standard_Input, Status_System),
                 Standard_Output => (Standard_Output, Standard_Input, Status_System)),
     Pre => (Status_System.Consumption_Measured <= Status_System.Supplied_Measured),
     Post => (Status_System.Consumption_Measured <= Status_System.Supplied_Measured);
   
   
   
end  Power_Grid_Energy_Stabilizer;


