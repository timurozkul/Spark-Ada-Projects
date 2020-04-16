pragma SPARK_Mode (On);

package Global_Variables is

   -- Average home consumption is 11 kw per day
   -- .13 watts per second is GW 0.000011
   -- Power grid system supplies 3.2 million homes in Wales
   -- with an average energy consumption of 416,000 watts (416 kw) per second

   -- The maximum possible electricity at any given time can be only 10,000kw.
   Maximum_Electricity_Possible : constant Integer := 10000000;--in watts or 10,000kw
   -- The maximum possible reserve electricty at any given time can be only 10,000kw
   Maximum_Reserved_Electricity_Possible : constant Integer := 1000000;--in watts or 1000kw
   -- The critical level of reserve is set to 5000 watts. One can always purchase
   -- more from a non renewable company.
   Critical_Reserve_level : constant Integer := 5000;-- watts

   subtype Electricity_Range is Integer range 0 .. Maximum_Electricity_Possible;
   subtype Reserve_Electricity_Range is Integer range 0 .. Maximum_Reserved_Electricity_Possible;
   -- There are two types status for the electricity one is for when its being actively
   -- used to supply the need consumption of energy, the other where its Not_Active
   -- which means that the battery reserves dont need to be used since the supply
   -- is enough for the consumption.
   type Status_Reserved_Electricity_Type is (Activated, Not_Activated);

   -- There are 4 glonal variables:
   -- Consumption_Measured - Which is the electricity needed to supply the city.
   -- Supplied_Measured - This is the electricity gather from the companies renewable sources.
   -- Reserved_Measured - This is the battery reserve for the electricity to when
   -- not enough electricity is supplied for the consumption.
   -- Status_Reserved_Electricity: This indicates if the battery is being used.
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
