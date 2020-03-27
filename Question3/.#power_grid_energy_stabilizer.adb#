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
			Status_Reserved_Electricity => Not_Activated);
   end Init;
   
   procedure Print_Status is
   begin
      AS_Put("Electric consumption = ");
      AS_Put(Status_System.Consumption_Measured);
      AS_Put_Line("");
      AS_Put("Electric supply = ");
      AS_Put(Status_System.Supplied_Measured);
      AS_Put_Line("");
      AS_Put("Reserve status = ");
      AS_Put(Status_System.Status_Reserved_Electricity);
      AS_Put_Line("");
      AS_Put("Electricity remaining in reserve = ");
      AS_Put(Status_System.Reserved_Measured);
   end Print_Status;
   
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
   
   function Status_Electricity_System_To_String (Status_Reserved_Electricity : Status_Reserved_Electricity_Type) return String is
      begin
	 if (Status_Reserved_Electricity = Activated) 
	 then return "Activated";
	 else return "Not_Activated";
	 end if;
   end Status_Electricity_System_To_String;
   
   function Is_Safe ((Status : Status_System_Type) return Boolean is
      begin
          -- This system has two critical points one if consumptionn becomes greater than
          -- supply & when the reserve levels drop below 5000 watts
         if(Integer(Status.Consumption_Measured) > Integer(Status.Supplied_Measured) 
                       AND Integer(Status.Reserved_Measured) > Critical_Reserve_level)) 
         then return true;
         else return false
    
   end Is_Safe;
  
     
end Power_Grid_Energy_Stabilizer;
	

      
