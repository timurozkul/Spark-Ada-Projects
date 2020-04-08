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
   procedure Print_Welcome with
      Global => (In_Out => Standard_Output);
   procedure Init with
     Global => (Output => (Standard_Output,Standard_Input,Status_System)),
     Depends => ((Standard_Output,Standard_Input,Status_System) => null),
     Post    => Is_Safe;
 
   function Is_Safe return Boolean;
  
   function Status_Electricity_System_To_String return String;
     
   procedure Read_Consumption with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
                 Standard_Input  => Standard_Input,
		 Status_System   => (Status_System, Standard_Input));
   
    procedure Read_Supply with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
		 Standard_Input  => Standard_Input,
		 Status_System   => (Status_System, Standard_Input));
   
    procedure Energy_Stabilizerg_System  with
     Global  => (In_Out => Status_System),
     Depends => (Status_System => Status_System),
     Post    => Is_Safe;
   
   
   -- Print Status prints out the status of the system on console
   procedure Print_Status with
     Global => (In_Out => Standard_Output, 
		Input  => Status_System),
     Depends => (Standard_Output => (Standard_Output,Status_System));

   procedure Refill_Reserve with
     Global  => (In_Out => Status_System),
     Depends => (Status_System => Status_System);
   
end  Power_Grid_Energy_Stabilizer;


