pragma SPARK_Mode (On);

with AS_IO_Wrapper;  use AS_IO_Wrapper; 


package body Power_Grid_Energy_Stabilizer is
   
   procedure Init is
   begin
      AS_Init_Standard_Input; 
      AS_Init_Standard_Output;
      AS_Put("Electric consumption = ");
   end Init;
   
   procedure Print_Status is
   begin
      AS_Put("Electric consumption = ");
      AS_Put();
      AS_Put_Line("");
      AS_Put("Current supply  = ");
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
      Status_System.Temperature_Measured := Temperature_Range(Temperature);
   end Read_Consumption;
   
   function Status_Electricity_System_To_String (Status_Reserved_Electricity : Status_Reserved_Electricity_Type) return String is
      begin
      -- it would be better to use a case construct
      -- since I didn't teach it I use here an if then else
	 if (Status_Reserved_Electricity = Activated) 
	 then return "Activated";
	 else return "Not_Activated";
	 end if;
      end Status_Electricity_System_To_String;
   
      
     
end Power_Grid_Energy_Stabilizer;
	

      
