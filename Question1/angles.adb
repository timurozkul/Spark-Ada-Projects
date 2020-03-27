pragma SPARK_Mode (On);

package body Angles is
 
   function AddAngles2 (X, Y : in angle) return angle is
      maxAngleValue : constant Integer := 360;
      aux : Integer;
   begin
      aux := Integer(X) + Integer(Y);
      if aux >= 360 then return angle(aux mod maxAngleValue);
      else return angle(aux); 
      end if; 
   end AddAngles2;   
   
   procedure AddAngles (X, Y : in angle; U: out angle) is
      maxAngleValue : constant Integer := 360;
      aux : Integer;
   begin
      aux := Integer(X) + Integer(Y);
      if aux >= 360 then U := angle(aux mod maxAngleValue);
      else U := angle(aux); 
      end if;
   end AddAngles;

end Angles;
     
     
   
     
   
