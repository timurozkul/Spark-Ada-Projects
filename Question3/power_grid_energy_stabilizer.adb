pragma SPARK_Mode (On);

with AS_IO_Wrapper;  use AS_IO_Wrapper; 


package body Power_Grid_Energy_Stabilizer is
   
   procedure Init is
   begin
      AS_Init_Standard_Input; 
      AS_Init_Standard_Output;
      AS_Put("Electric consumption = ");
      Status_System := (Consumption_Measured  => 0,
                        Supplied_Measured => 0,
                        Reserved_Measured => Maximum_Reserved_Electricity_Possible,
			Status_Reserved_Electricity => Not_Activated);
   end Init;
   
   function Is_Safe (Status : Status_System_Type) return Boolean is
      begin
          -- This system has two critical points one if consumptionn becomes greater than
          -- supply & when the reserve levels drop below 5000 watts
         if(Integer(Status.Consumption_Measured) > Integer(Status.Supplied_Measured) 
                       AND Integer(Status.Reserved_Measured) > Critical_Reserve_level)) 
         then return true;
         else return false
    
   end Is_Safe;
  
  procedure Read_Consumption is
      Electricity: Integer;
   begin
      AS_Put_Line("Please type in current electricity consumption as read by sensor");
      loop
	 AS_Get(Electricity,"Please type in an integer");
	 exit when (Electricity >=0) and (Electricity <= Maximum_Temperature_Possible);
	 AS_Put("Please type in a value between 0 and ");
	 AS_Put(Maximum_Electricity_Possible);
	 AS_Put_Line("");
      end loop;
      Status_System.Consumption_Measured := Electricity_Range(Electricity);
   end Read_Consumption;

    procedure Read_Supply is
      Electricity: Integer;
   begin
      AS_Put_Line("Please type in current electricity supplied as read by sensor.");
      loop
	 AS_Get(Electricity,"Please type in an integer: ");
	 exit when (Electricity >=0) and (Electricity <= Maximum_Temperature_Possible);
	 AS_Put("Please type in a value between 0 and ");
	 AS_Put(Maximum_Electricity_Possible);
	 AS_Put_Line("");
      end loop;
      Status_System.Supplied_Measured := Electricity_Range(Electricity);
   end Read_Supply;
   
   function Status_Electricity_System_To_String (Status_Reserved_Electricity : Status_Reserved_Electricity_Type) return String is
      begin
         case Status_Reserved_Electricity = Activated is
            when Activated => return "Activated";
            when Not_Activated => return "Not_Activated";
	 --if (Status_Reserved_Electricity = Activated) 
	 --then return "Activated";
	 --else return "Not_Activated";
	 --end if;
   end Status_Electricity_System_To_String;
   
   procedure Energy_Stabilizerg_System  is
   begin
      if Integer(Status_System.Consumption_Measured) > Integer(Status_System.Supplied_Measured)
        AND Reserved_Measured > 1
      then Status_System.Status_Reserved_Electricity := Activated;
      else Status_System.Status_Reserved_Electricity := Not_Activated;
      end if;
   end Energy_Stabilizerg_System;
      
   procedure Print_Status is
      -- TODO: innput Critical_Reserve_level & print it 
   begin
      AS_Put("Electric consumption = ");
      AS_Put(Status_System.Consumption_Measured);
      AS_Put_Line("");
      AS_Put("Electric supply = ");
      AS_Put(Status_System.Supplied_Measured);
      AS_Put_Line("");
         
      if (Status_System.Consumption_Measured > (Status_System.Supplied_Measured + Status_System.Reserved_Measured)) 
         then return AS_Put("System Critical! Not enough energy to supply all.");
            
      if (Status_System.Status_Reserved_Electricity < Critical_Reserve_level) 
	 then return AS_Put("Reserve Levels at Critical! ");
      AS_Put("Reserve status = ");
      AS_Put(Status_System.Status_Reserved_Electricity);
      AS_Put_Line("");
      AS_Put("Electricity remaining in reserve = ");
      AS_Put(Status_System.Reserved_Measured);
      end Print_Status;
      
   procedure Refill_Reserve is
         Remaining_Supply: Integer;
         Reserve_Total: Integer;
      begin
      if Integer(Status_System.Supplied_Measured) > Integer(Status_System.Consumption_Measured)
         then 
            Remaining_Supply := Integer(Status_System.Supplied_Measured) - Integer(Status_System.Consumption_Measured);
            Reserve_Total := Remaining_Supply + Integer(Status_System.Reserved_Measured);
            Status_System.Reserved_Measured := Reserve_Electricity_Range(Reserve_Total);
      end if;
   end Refill_Reserve;
  
     
end Power_Grid_Energy_Stabilizer;
	

      
