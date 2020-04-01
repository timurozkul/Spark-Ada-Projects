-- This file was created by Timur Ozkul
-- it is an ultra simple example of a critical system
-- namely a energy stabilizer for a power grid.
-- If the consumption for the energy gets to a critical level 
-- then the necessary is extra electricity is taken from its 
-- storage facilicty.

pragma SPARK_Mode (On);

with SPARK.Text_IO;use  SPARK.Text_IO;


package Power_Grid_Energy_Stabilizer is
   
   -- Average home consumption is 11 kw per day 
   -- .13 watts per second is GW 0.000011
   -- Power grid system supplies 3.2 million homes in Wales 
   -- with an average energy consumption of 416,000 watts (416 kw) per second
   
   Maximum_Electricity_Possible : constant Integer := 10000000;--in watts or 10,000kw
   Maximum_Reserved_Electricity_Possible : constant Integer := 1000000;--in watts or 1000kw
   Critical_Reserve_level : constant Integer := 5000;
   
   subtype Electricity_Range is Integer range 0 .. Maximum_Electricity_Possible;
   subtype Reserve_Electricity_Range is Integer range 0 .. Maximum_Reserved_Electricity_Possible;
     
   type Status_Reserved_Electricity_Type is (Activated, Not_Activated);  
   
   type Status_System_Type  is 
      record
         Consumption_Measured : Electricity_Range;
         Supplied_Measured : Electricity_Range;
         Reserved_Measured : Reserve_Electricity_Range;
	 Status_Reserved_Electricity : Status_Reserved_Electricity_Type;
      end record;
   
   Status_System : Status_System_Type;
   

   
   
   procedure Init with
     Global => (Output => (Standard_Output,Standard_Input,Status_System)),
     Depends => ((Standard_Output,Standard_Input,Status_System) => null),
     Post    => Is_Safe(Status_System);
 
   function Is_Safe (Status : Status_System_Type) return Boolean;
  
   function Status_Electricity_System_To_String (Status_Reserved_Electricity : Status_Reserved_Electricity_Type) return String;
     
   procedure Read_Consumption with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System),
                Input => Maximum_Reserved_Electricity_Possible),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
		 Standard_Input  => (Standard_Input, Maximum_Reserved_Electricity_Possible),
                 Status_System   => (Status_System, Standard_Input));
   
    procedure Read_Supply with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System),
                Input => Maximum_Reserved_Electricity_Possible),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
		  Standard_Input  => (Standard_Input, Maximum_Reserved_Electricity_Possible),
                 Status_System   => (Status_System, Standard_Input));
   
    procedure Energy_Stabilizerg_System  with
     Global  => (In_Out => Status_System),
     Depends => (Status_System => Status_System),
     Post    => Is_Safe(Status_System);
   
   -- Print Status prints out the status of the system on console
   procedure Print_Status with
     Global => (In_Out => Standard_Output, 
		Input  => (Status_System, Critical_Reserve_level)),
     Depends => (Standard_Output => (Standard_Output,Status_System, Critical_Reserve_level));

   procedure Refill_Reserve with
     Global  => (In_Out => Status_System),
     Depends => (Status_System => Status_System);
   
end  Power_Grid_Energy_Stabilizer;


