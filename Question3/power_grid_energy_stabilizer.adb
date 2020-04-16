pragma SPARK_Mode (On);

with AS_IO_Wrapper;  
use AS_IO_Wrapper; 


package body Power_Grid_Energy_Stabilizer is
   
   procedure Init is
   begin
      -- Add the Input/Ouput library.
      AS_Init_Standard_Input; 
      AS_Init_Standard_Output;
      -- Set the global variables to their inital value.
      Status_System.Consumption_Measured := 0;
      Status_System.Supplied_Measured := 0;
      Status_System.Reserved_Measured := Maximum_Reserved_Electricity_Possible;
      Status_System.Status_Reserved_Electricity := Not_Activated;
      
   end Init;
   
   procedure Print_Welcome is
   begin
      AS_Put_Line("=============================================");
      AS_Put_Line("");
      AS_Put_Line(" Power Grid Energy Stabilizer Setzter System");
      AS_Put_Line("");
      AS_Put_Line("=============================================");
      AS_Put_Line("");
   end Print_Welcome;
  
  procedure Read_Consumption is
      Electricity: Integer;
   begin
      AS_Put_Line("Please type in current electricity consumption as read by the sensor (in Watts)");
      loop
         AS_Get(Electricity,"Please type in an integer");
         -- The loop will exit once the input is between 0 and its maximum possible value
	 exit when (Electricity >=0) and (Electricity <= Maximum_Reserved_Electricity_Possible);
	 AS_Put("Please type in a value between 0 and ");
	 AS_Put(Maximum_Electricity_Possible);
	 AS_Put_Line("");
      end loop;
      -- The input then gets assigned to the global variable
      Status_System.Consumption_Measured := Electricity_Range(Electricity);
   end Read_Consumption;

   procedure Read_Supply is
      Electricity: Integer;
   begin
      AS_Put_Line("Please type in current electricity supplied as read by the sensor (in Watts)");
      loop
         AS_Get(Electricity,"Please type in an integer: ");
         -- The loop will exit once the input is between 0 and its maximum possible value
	 exit when (Electricity >=0) and (Electricity <= Maximum_Reserved_Electricity_Possible);
	 AS_Put("Please type in a value between 0 and ");
	 AS_Put(Maximum_Electricity_Possible);
	 AS_Put_Line("");
      end loop;
      -- The input then gets assigned to the global variable
      Status_System.Supplied_Measured := Electricity_Range(Electricity);
   end Read_Supply;   

   procedure Energy_Stabilizerg_System is
      Electricity_Required: Integer;
   begin
    -- Energy_Stabilizerg_System procedure needs only to stabilize the system if there isnt enough energy supplied  
    if Integer(Status_System.Consumption_Measured) > Integer(Status_System.Supplied_Measured)
      then 
         Electricity_Required := Integer(Status_System.Consumption_Measured) - Integer(Status_System.Supplied_Measured);
         -- if there is enough energy in the reserve batteries
         if Electricity_Required <= Status_System.Reserved_Measured 
            then
            -- Update reserve battery status to active
            Status_System.Status_Reserved_Electricity := Activated;
            -- Subtract the needed electricy from the battery
            Status_System.Reserved_Measured := Status_System.Reserved_Measured - Electricity_Required;
            -- The battery reserve then gets added to the supply 
            Status_System.Supplied_Measured := Status_System.Consumption_Measured;
           else 
            AS_Put_Line("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            AS_Put_Line("");
            AS_Put_Line(" !!!");
            AS_Put_Line("System Critical");
            AS_Put_Line("Entire system hasnt got enough energy to meet demand");
            AS_Put_Line("Automatic purchase of energy from non renewable energy company");
            -- If there isnt enough energy in the battery, then the energy left in the battery
            -- will be used.
            Status_System.Reserved_Measured := 0;
            -- The remainder of the needed ennergy will be bought from another company and added to the supply
            Status_System.Supplied_Measured := Status_System.Consumption_Measured;
            Status_System.Status_Reserved_Electricity := Activated;
            AS_Put_Line("Supply increased to = Status_System.Supplied_Measured");
         end if;
        
      end if;
   end Energy_Stabilizerg_System;
   
   procedure Print_Status is
   begin
      AS_Put_Line("");
      AS_Put_Line("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      AS_Put("Electric consumption = ");
      AS_Put(Status_System.Consumption_Measured);
      AS_Put_Line(" watts");
      AS_Put("Electric supply = ");
      AS_Put(Status_System.Supplied_Measured);
      AS_Put_Line(" watts"); 
      -- prints out that the reserve is at critical level if it reaches the Critical_Reserve_level threshold
      if (Integer(Status_System.Reserved_Measured) < Critical_Reserve_level) 
         then AS_Put("Reserve Levels at Critical! ");
      end if;
      AS_Put("Reserve status = ");
      AS_Put(Status_Electricity_System_To_String);
      AS_Put_Line("");
      AS_Put("Electricity remaining in reserve = ");
      AS_Put(Status_System.Reserved_Measured);
      AS_Put_Line(" watts");
      AS_Put("Remaining supply to refill battery = ");
      -- If there is supply left over then print out the amount that was refilled
      if ((Integer(Status_System.Supplied_Measured) - Integer(Status_System.Consumption_Measured)) > 0) 
         then  
         AS_Put(Integer(Status_System.Supplied_Measured) - Integer(Status_System.Consumption_Measured));
         AS_Put_Line(" watts");
         else AS_Put_Line("0 watts");
      end if;
     
      AS_Put_Line("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      AS_Put_Line("");
   end Print_Status;
   
   function Status_Electricity_System_To_String return String is
   begin
      -- If the value of Status_Reserved_Electricity is active then return the Activated
      -- else return the string Not_Activated
         case Status_System.Status_Reserved_Electricity = Activated is
            when true => return "Activated";
            when false => return "Not_Activated";
         end case;
   end Status_Electricity_System_To_String; 
   
   procedure Print_Reserve_levels is
   begin
      AS_Put_Line("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      AS_Put_Line(" - After Refilling Reserves - ");
      AS_Put_Line("");
      AS_Put("Electricity remaining = ");
      AS_Put(Status_System.Reserved_Measured);
      AS_Put_Line(" watts");
      AS_Put_Line("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      AS_Put_Line("");
     
   end Print_Reserve_levels;
     
   procedure Refill_Reserve is
      -- Remaining_Supply is the remaining energy supply once the ennergy comsumption is subtracted.
      Remaining_Supply: Integer;
      -- 
      Reserve_Total: Integer;
      User_Input : String(1 .. 20);
   begin
      Remaining_Supply := Integer(Status_System.Supplied_Measured) - Integer(Status_System.Consumption_Measured);
      -- If we have remaining supply after consumption and there is space to fill the energy reserves,
      if Remaining_Supply > 0 AND Integer(Status_System.Reserved_Measured) < Maximum_Reserved_Electricity_Possible
         then 
         -- Refill the battery with the remaining energy from the supply.
         -- If the energy supply and the energy in the battery is greater then the maximum allowed energy in the battery,  
         if (Remaining_Supply + Integer(Status_System.Reserved_Measured)) > Maximum_Reserved_Electricity_Possible
         then 
            -- then let the reserve battery energy equal that of the maximum possible energy level
            Status_System.Reserved_Measured := Maximum_Reserved_Electricity_Possible;
         else
            -- else add the remaining supply to the reserve energy
            Reserve_Total := Remaining_Supply + Integer(Status_System.Reserved_Measured);
            Status_System.Reserved_Measured := Reserve_Electricity_Range(Reserve_Total);
            Print_Reserve_levels;
        end if;
      end if;
      -- If the battery level is still below critical, it gives the option to user to refill the battery
      -- from non-renewable energy company
      if(Status_System.Reserved_Measured < Critical_Reserve_level)
            then
            AS_Put_Line("The battery reserve is under crtical levels");
            AS_Put_Line("Would you like to buy non renewable energy from another company to refill the battery back above level critical?");
            AS_Put_Line("");
            AS_Put_Line("Please type (y/n)? Please enter a non-empty string");
            AS_Get(User_Input);
            AS_Put_Line("");
               if User_Input(1 .. 1) = "y"
               then
                -- Fill the battery from non renewable sources back above critical reserve level
                Status_System.Reserved_Measured := Critical_Reserve_level + 1; 
                Print_Reserve_levels;
               end if;
      end if;
      Status_System.Status_Reserved_Electricity := Not_Activated;
   end Refill_Reserve;
   
 --  procedure Reset_Reserve_Statues is
  -- begin
      -- Every iteration of the loop inn main.adb the status of the battery is set to not active.
    --  Status_System.Status_Reserved_Electricity := Not_Activated;
   -- end Reset_Reserve_Statues;
   
end Power_Grid_Energy_Stabilizer;
	

      
