-- This file was created by Timur Ozkul
-- it is an ultra simple example of a critical system
-- namely a energy stabilizer for a power grid.
-- If the consumption for the energy gets to a critical level 
-- then the necessary is extra electricity is taken from its 
-- storage facilicty.

pragma SPARK_Mode (On);

--with SPARK.Text_IO;use  SPARK.Text_IO;


package Power_Grid_Energy_Stabilizer is
   
   -- Average home consumption is 11 kw per day 
   -- .13 watts per second is GW 0.000011
   -- Power grid system supplies 3.2 million homes in Wales 
   -- with an average energy consumption of 416,000 watts (416 kw) per second
   
   Maximum_Electricity_Possible : constant Integer := 10000000;--in watts or 10,000kw
   Maximum_Reserved_Electricity_Possible : constant Integer := 1000000;--in watts or 1000kw
   
   subtype Electricity_Range is new Integer range 0 .. Maximum_Electricity_Possible
   subtype Reserve_Electricity_Range is new Integer range 0 .. Maximum_Reserved_Electricity_Possible
     
   type Status_Reserved_Electricity_Type is (Activated, Not_Activated);  
   
   type Status_System_Type  is 
      record
         Supplied_Measured : Electricity_Range;
	 Consumption_Measured : Electricity_Range;
	 Status_Reserved_Electricity : Status_Reserved_Electricity_Type;
      end record;
   
   Status_System : Status_System_Type;
   
   -- Function to create fake consumption energy (Random number generator) or (user input)
   -- Function to create fake supply energy (Random number generator)
   -- Function to check if consumption >=< supply
   -- Function to refill reserverse every second by 10 watts if reserve is currently not being used 
   
   
   -- Print Status prints out the status of the system on console
   procedure Print_Status with
     Global => (In_Out => Standard_Output, 
		Input  => Status_System),
     Depends => (Standard_Output => (Standard_Output,Status_System));

   procedure Init with
     Global => (Output => (Standard_Output,Standard_Input,Status_System)),
     Depends => ((Standard_Output,Standard_Input,Status_System) => null),
     Post    => Is_Safe(Status_System);
     
   -- Read_Consumption gets the current temperature from console input output
   -- and updates Status_System
   -- it does NOT monitor the cooling system
   -- so after executing it the system might be unsafe.x
   procedure Read_Consumption with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
		 Standard_Input  => Standard_Input,
		 Status_System   => (Status_System, Standard_Input));
   
   
end  Power_Grid_Energy_Stabilizer;


