pragma SPARK_Mode (On);

with AS_IO_Wrapper;
use AS_IO_Wrapper;
with Nkires;
use Nkires;


procedure Main is
   N, K : Integer;
   Res, I, Last : Integer;
  User_Input : String(1 .. 20);
begin
    -- First we initialise standard_input and standard output
   AS_Init_Standard_Output;
   AS_Init_Standard_Input;   
   loop   
      AS_Put_Line("Nkires program");
      loop
	 AS_Put("Put number for K:");
         AS_Get(K);  
	exit when K in 0 .. 1000;
	As_Put_Line("Please enter a number between 0 to a 1000");
      end loop;
     
      loop
	 AS_Put("Put number for N:");
         AS_Get(N);   
	exit when N in 1 .. 1000;
	As_Put_Line("Please enter a number between 0 to a 1000");
      end loop;
     
      
      NkiresProc(N, K, I, Res);
      
     AS_Put("I   = ");
     AS_Put_Line(I);
     AS_Put("Res = ");
      AS_Put_Line(Res);
      
      loop
	As_Put("Do you want to try again (y/n)? ");
	As_Get_Line(User_Input, Last);
	exit when Last > 0;
	As_Put_Line("Please enter a non-empty string");
      end loop;
      exit when User_Input(1 .. 1) = "n";
      
   end loop;   
   --loop
     -- Put("Enter a number in hour from 0 .. 23: ");   
     -- Get(T);
     -- Put("The result of the function  is ");
     -- Put(To12(T));
     -- New_Line;   
     ---- To12Proc(T,U);
     -- Put("The result of the procedure is ");
     -- Put(U);   
     -- New_Line;   
     -- Put_Line("Note that this program is not the correct conversion from 24hrs to am/pm"); 
     -- Put_Line("See ../README.txt for details");
     -- Get_Line(User_Input, Last);  -- clearing input buffer
     -- Put("Do you want to try again (y/n):");
     -- Get_Line(User_Input, Last);
    --  exit when User_Input(1 .. 1) = "n";
   --end loop;   
end Main;


