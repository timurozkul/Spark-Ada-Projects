pragma SPARK_Mode;
-- pragma(
with AS_IO_Wrapper;  use AS_IO_Wrapper; 

with Angles;  
use Angles; 

procedure Main is
   X, Y : angle;
   U : angle;
   User_Input : String(1 .. 20);
   Xtemp, Ytemp, Last : Integer;
begin
    -- First we initialise standard_input and standard output
   AS_Init_Standard_Output;
   AS_Init_Standard_Input;   
   loop
      loop
         AS_Put("Enter an angle from 0 .. 359: ");   
         AS_Get(Xtemp);
         exit when Xtemp in 0 .. 359;
         AS_Put_Line("Please Enter a number between 0 and 359");
      end loop;
      X := Xtemp;
      loop
         AS_Put("Enter another angle from 0 .. 359: ");
         AS_Get(Ytemp);
         exit when Ytemp in 0 .. 359;
         AS_Put_Line("Please Enter a number between 0 and 359");
      end loop;    
      Y := Ytemp;
      AddAngles(angle(X), angle(Y), U);
      AS_Put_Line("The sum of angles is: ");
      AS_Put_Line(U);
      AS_Put_Line("The sum of the angles from the function is: ");
      AS_Put(Integer(AddAngles2(angle(X), angle(Y)))); 
      
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


