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
   

   -- The Init procedure is used to initialise the program. It sets the Input/Ouput library
   -- and sets the global veriables to their starting values.
   procedure Init with
     Global => (Output => (Standard_Output,Standard_Input,Status_System)),
     Depends => ((Standard_Output,Standard_Input,Status_System) => null),
     Post => ((Status_System.Consumption_Measured = 0) AND
     (Status_System.Supplied_Measured = 0) AND
     (Status_System.Reserved_Measured = Maximum_Reserved_Electricity_Possible) AND
     (Status_System.Status_Reserved_Electricity = Not_Activated));
   
    -- Print_Welcome prints out a welcome message.
    procedure Print_Welcome with
     Global => (In_Out => Standard_Output),
     Depends => (Standard_Output => Standard_Output);
   
   -- Read_Consumption reads the electrical consumption from the user input.
   procedure Read_Consumption with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output, Standard_Input),
                 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input)),
       Pre => (Status_System.Status_Reserved_Electricity = Not_Activated);
   
    -- Read_Supply reads the electrical supply from the user input.
    procedure Read_Supply with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output, Standard_Input),
		 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
   
   -- Energy_Stabilizerg_System makes certain that the energy supplied is equal to the energy consumption.
   procedure Energy_Stabilizerg_System  with
     Global => (In_Out => (Status_System, Standard_Output)),              
     Depends => (Status_System => (Status_System),
                 Standard_Output => (Standard_Output, Status_System)),
     Post => (Status_System.Consumption_Measured <= Status_System.Supplied_Measured); 
   
   -- Print_Status prints out the status of the system.
   procedure Print_Status with
     Global => (In_Out => (Standard_Output),
                Input => Status_System),
     Depends => (Standard_Output => ( Standard_Output,Status_System));
    -- Post => (Status_System.Consumption_Measured <= Status_System.Supplied_Measured);
   
   -- This function converts a value into Status_Reserved_Electricity_Type
   -- into a string which can be printed to console.
    function Status_Electricity_System_To_String return String;
   -- Global => (Input => Status_System);
   
   -- This procedure prints the reserve levels after refilling either from its 
   -- own supply leftover or from buying it from another non renewable energy 
   -- company. Its ony called from the Refill_Reserve procedure.
   procedure Print_Reserve_levels with
     Global => (In_Out => Standard_Output,
                Input => Status_System),
     Depends => (Standard_Output => (Standard_Output, Status_System));
   
   -- Refill_Reserve refills the resereves of the battery if there is extra supply 
   -- left or if its under the critical reserve level then it will give the option
   -- to the user if they want to purchase from non-renewable energy company.
   procedure Refill_Reserve with
     Global => (In_Out => (Standard_Input, Standard_Output, Status_System)),
     Depends => (Status_System => (Status_System, Standard_Input),
                 Standard_Input => (Standard_Input, Status_System),
                 Standard_Output => (Standard_Output, Standard_Input, Status_System)),
       Pre => (Status_System.Consumption_Measured <= Status_System.Supplied_Measured),
      Post => ((Status_System.Consumption_Measured <= Status_System.Supplied_Measured) AND  
                (Status_System.Status_Reserved_Electricity = Not_Activated));
   
   -- 
  -- procedure Reset_Reserve_Statues with
    -- Global => (In_Out => Status_System),
     --Depends => (Status_System => Status_System),
     -- Pre => ((Status_System.Consumption_Measured <= Status_System.Supplied_Measured) AND
        --       ((Status_System.Status_Reserved_Electricity = Not_Activated) OR 
          --  (Status_System.Status_Reserved_Electricity = Activated))),
     -- Post => ((Status_System.Consumption_Measured <= Status_System.Supplied_Measured) AND
       --      (Status_System.Status_Reserved_Electricity = Not_Activated));
   

end  Power_Grid_Energy_Stabilizer;


