pragma SPARK_Mode (On);

with AS_IO_Wrapper;  use AS_IO_Wrapper; 


package body Power_Grid_Energy_Stabilizer is
   
   
   
   procedure Init is
   begin
      AS_Init_Standard_Input; 
      AS_Init_Standard_Output;
      AS_Put("Temperature = ");
   end Init;
   
   
      
     
end Power_Grid_Energy_Stabilizer;
	

      
