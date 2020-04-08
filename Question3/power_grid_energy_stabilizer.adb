pragma SPARK_Mode (On);

with AS_IO_Wrapper;  use AS_IO_Wrapper; 


package body Power_Grid_Energy_Stabilizer is
   
   procedure Print_Welcome is
      -- TODO: innput Critical_Reserve_level & print it 
   begin
      AS_Put_Line("=============================================");
      AS_Put_Line("");
      AS_Put_Line("Power Grid Energy Stabilizer Setzter System");
      AS_Put_Line("by Timur Ozkul");
      AS_Put_Line("");
      AS_Put_Line("=============================================");
      AS_Put_Line("");
   end Print_Welcome;
   
   procedure Init is
   begin
      AS_Init_Standard_Input; 
      AS_Init_Standard_Output;
      Status_System := (Consumption_Measured  => 0,
                        Supplied_Measured => 0,
                        Reserved_Measured => Maximum_Reserved_Electricity_Possible,
			Status_Reserved_Electricity => Not_Activated);
   end Init;
   
   function Is_Safe return Boolean is
      begin
          -- This system has two critical points one if consumptionn becomes greater than
          -- supply & when the reserve levels drop below 5000 watts
         if(Integer(Status_System.Consumption_Measured) >= Integer(Status_System.Supplied_Measured) 
                       AND Integer(Status_System.Reserved_Measured) > Critical_Reserve_level) 
           then return true;
           else return false;
         end if;
      end Is_Safe;
  
  procedure Read_Consumption is
      Electricity: Integer;
   begin
      AS_Put_Line("Please type in current electricity consumption as read by the sensor (in Watts)");
      loop
	 AS_Get(Electricity,"Please type in an integer");
	 exit when (Electricity >=0) and (Electricity <= Maximum_Reserved_Electricity_Possible);
	 AS_Put("Please type in a value between 0 and ");
	 AS_Put(Maximum_Electricity_Possible);
	 AS_Put_Line("");
      end loop;
      Status_System.Consumption_Measured := Electricity_Range(Electricity);
   end Read_Consumption;

    procedure Read_Supply is
      Electricity: Integer;
   begin
      AS_Put_Line("Please type in current electricity supplied as read by the sensor (in Watts)");
      loop
	 AS_Get(Electricity,"Please type in an integer: ");
	 exit when (Electricity >=0) and (Electricity <= Maximum_Reserved_Electricity_Possible);
	 AS_Put("Please type in a value between 0 and ");
	 AS_Put(Maximum_Electricity_Possible);
	 AS_Put_Line("");
      end loop;
      Status_System.Supplied_Measured := Electricity_Range(Electricity);
   end Read_Supply;
   
   function Status_Electricity_System_To_String return String is
      begin
         case Status_System.Status_Reserved_Electricity = Activated is
            when true => return "Activated";
            when false => return "Not_Activated";
         end case;
   end Status_Electricity_System_To_String;
   
   procedure Energy_Stabilizerg_System is
      Electricity_Required: Integer;
   begin
      if Integer(Status_System.Consumption_Measured) > Integer(Status_System.Supplied_Measured)
      then 
         Electricity_Required := Integer(Status_System.Consumption_Measured) - Integer(Status_System.Supplied_Measured);
         if Electricity_Required <= Status_System.Reserved_Measured AND Status_System.Reserved_Measured > 0
           then
            Status_System.Status_Reserved_Electricity := Activated;
            Status_System.Reserved_Measured := Status_System.Reserved_Measured - Electricity_Required;
           else 
            AS_Put_Line("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            AS_Put_Line("");
            AS_Put_Line(" !!!");
            AS_Put_Line("System Critical");
            AS_Put_Line("Entire system hasnt got enough energy to meet demand");
            AS_Put_Line("Automatic purchase of energy from non renewable energy company");
            Status_System.Reserved_Measured := 0;
            Status_System.Supplied_Measured := Status_System.Consumption_Measured;
            AS_Put_Line("Supply increased to = Status_System.Supplied_Measured");
         end if;
      else Status_System.Status_Reserved_Electricity := Not_Activated;
      end if;
   end Energy_Stabilizerg_System;
   
      
   procedure Print_Status is
      -- TODO: innput Critical_Reserve_level & print it 
   begin
      AS_Put_Line("");
      AS_Put_Line("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      AS_Put("Electric consumption = ");
      AS_Put(Status_System.Consumption_Measured);
      AS_Put_Line(" watts");
      AS_Put("Electric supply = ");
      AS_Put(Status_System.Supplied_Measured);
      AS_Put_Line(" watts");  
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
      if ((Integer(Status_System.Supplied_Measured) - Integer(Status_System.Consumption_Measured)) > 0) 
         then  
         AS_Put(Integer(Status_System.Supplied_Measured) - Integer(Status_System.Consumption_Measured));
         AS_Put_Line(" watts");
         else AS_Put_Line("0 watts");
      end if;
     
      AS_Put_Line("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      AS_Put_Line("");
      end Print_Status;
      
   procedure Refill_Reserve is
      Remaining_Supply: Integer;
      Reserve_Total: Integer;
      Last : Integer;
      User_Input : String(1 .. 20);
   begin
      Remaining_Supply := Integer(Status_System.Supplied_Measured) - Integer(Status_System.Consumption_Measured);
      -- If we have remaining supply after consumption and there is space to fill the energy reserves
      if Remaining_Supply > 0 AND Integer(Status_System.Reserved_Measured) < Maximum_Reserved_Electricity_Possible
         then 
            -- Refill the battery with the remaining energy
            Reserve_Total := Remaining_Supply + Integer(Status_System.Reserved_Measured);
         Status_System.Reserved_Measured := Reserve_Electricity_Range(Reserve_Total);
         Print_Reserve_levels;
      end if;
      -- If the battery level is still below critical
      if(Status_System.Reserved_Measured < Critical_Reserve_level)
            then
            AS_Put_Line("The battery reserve is under crtical levels");
            AS_Put_Line("Would you like to buy non renewable energy from another company to refill the battery back above level critical?");
            AS_Put_Line("");
            AS_Put_Line("Please type (y/n)? Please enter a non-empty string");
            As_Get_Line(User_Input, Last);
            AS_Put_Line("");
               if User_Input(1 .. 1) = "y"
               then
                  -- Fill the battery from non renewable sources
                Status_System.Reserved_Measured := Critical_Reserve_level;
                Print_Reserve_levels;
               end if;
      end if;
      
   end Refill_Reserve;
   
   -- This procedure prints the reserve levels after refilling either from its own supply leftover or 
   -- from buying it from another non renewable energy company. Its ony called from the Refill_Reserve procedure.
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

    
   
end Power_Grid_Energy_Stabilizer;
	

      
