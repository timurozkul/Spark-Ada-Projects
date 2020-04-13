pragma SPARK_Mode (On);

package body Angles is
 
   -- This AddAngles procedure takes in two angles as input and gives the sum
   procedure AddAngles (X, Y : in angle; U: out angle) is
      -- We define the maximum value for an angle
      maxAngleValue : constant Integer := 360;
      -- The aux is used to help calculate the sum
      aux : Integer;
   begin
      aux := Integer(X) + Integer(Y);
      -- If the addition of the two values are less then 360 then simply add them
      -- else take the sum and mod with the maximum value for an angle
      if aux >= 360 then U := angle(aux mod maxAngleValue);
      else U := angle(aux); 
      end if;
   end AddAngles;
   
    -- This AddAngles function takes in two angles as input and return the sum
   function AddAngles2 (X, Y : in angle) return angle is
      -- We define the maximum value for an angle
      maxAngleValue : constant Integer := 360;
      -- The aux is used to help calculate the sum
      aux : Integer;
   begin
      aux := Integer(X) + Integer(Y);
      -- If the addition of the two values are less then 360 then simply add them
      -- else take the sum and mod with the maximum value for an angle
      if aux >= 360 then return angle(aux mod maxAngleValue);
      else return angle(aux); 
      end if; 
   end AddAngles2;   

end Angles;
     
     
   
     
   
