pragma SPARK_Mode (On);

package Global_Variables is

   -- Average home consumption is 11 kw per day
   -- .13 watts per second is GW 0.000011
   -- Power grid system supplies 3.2 million homes in Wales
   -- with an average energy consumption of 416,000 watts (416 kw) per second

   Maximum_Electricity_Possible : constant Integer := 10000000;--in watts or 10,000kw
   Maximum_Reserved_Electricity_Possible : constant Integer := 1000000;--in watts or 1000kw
   Critical_Reserve_level : constant Integer := 5000;


   --Maximum_Electricity_Possible : Integer;
  -- Maximum_Reserved_Electricity_Possible : Integer;
   --Critical_Reserve_level : Integer;

  -- Electricity_Range : Integer;
   --Reserve_Electricity_Range : Integer;





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

   Status_Reserved_Electricity : Status_Reserved_Electricity_Type;
   Status_System : Status_System_Type;

end  Global_Variables;
