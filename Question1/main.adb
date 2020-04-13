pragma SPARK_Mode;
with AS_IO_Wrapper;  
use AS_IO_Wrapper; 
with Angles;  
use Angles; 

-- This program accepts two angles which are supposed to be integers between 0 and 359, 
-- adds them and computes the resulting angle, which is obtained by possibly 
-- deducting 360 in order to be in the range of angles.

procedure Main is
   -- X, Y are the valid input value which are two angles.
   X, Y : angle;
   -- U is the sum of the two X, Y angles
   U : angle;
   User_Input : String(1 .. 20);
   -- Xtemp, Ytemp are the temperorary input value which are the angles,
   -- used to check if the values are valid. 
   Xtemp, Ytemp, Last : Integer;
begin
    -- First we initialise standard_input and standard output.
   AS_Init_Standard_Output;
   AS_Init_Standard_Input;   
   loop
      
      -- This loop is used to get the input value of the angle. 
      loop
         AS_Put("Enter an angle from 0 .. 359: ");   
         AS_Get(Xtemp);
         -- The loop is exited when the correct value is given
         exit when Xtemp in 0 .. 359;
         AS_Put_Line("Please Enter a number between 0 and 359");
      end loop;
      -- If the loop exits that means that the value is correct and is stored 
      -- in the X variable. 
      X := Xtemp;
      -- This loop is used to get the input value of the angle. 
      loop
         AS_Put("Enter another angle from 0 .. 359: ");
         AS_Get(Ytemp);
         -- The loop is exited when the correct value is given
         exit when Ytemp in 0 .. 359;
         AS_Put_Line("Please Enter a number between 0 and 359");
      end loop;    
      -- If the loop exits that means that the value is correct and is stored 
      -- in the X variable. 
      Y := Ytemp;
      -- This is the procedure that adds the two angles and gives the sum.
      AddAngles(angle(X), angle(Y), U);
      AS_Put_Line("The sum of angles is: ");
      AS_Put_Line(U);
      AS_Put_Line("The sum of the angles from the function is: ");
      -- This function does the same as the previous procedure but instead returns the sum.
      AS_Put(Integer(AddAngles2(angle(X), angle(Y)))); 
      -- This loop is used to exit the program
      loop
        AS_Put_Line("");
	As_Put("Do you want to try again (y/n)? ");
	As_Get_Line(User_Input, Last);
	exit when Last = 1;
	As_Put_Line("Please enter a non-empty string");
     end loop;
     exit when User_Input(1 .. 1) = "n";
   end loop;   
end Main;


