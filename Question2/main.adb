pragma SPARK_Mode (On);

with AS_IO_Wrapper;
use AS_IO_Wrapper;
with Nkires;
use Nkires;

procedure Main is
  -- N, K are two integer values that the user will input in the range of 0 to 1000  
  N, K : Integer;
  Res, I, Last : Integer;
  User_Input : String(1 .. 20);
begin
   -- First we initialise standard_input and standard output
   AS_Init_Standard_Output;
   AS_Init_Standard_Input;   
   -- The program runs in a loop until the user chooses to exit   
   loop   
      AS_Put_Line("Nkires program");
      -- This loop is used to get the user input for K
      loop
	 AS_Put("Put number for K:");
         AS_Get(K);  
         -- The loop will exit if a value is given between 0 and 1000
	exit when K in 0 .. 1000;
	As_Put_Line("Please enter a number between 0 to a 1000");
      end loop;
      -- This loop is used to get the user input for N
      loop
	 AS_Put("Put number for N:");
         AS_Get(N);   
         -- The loop will exit if a value is given between 0 and 1000
	exit when N in 1 .. 1000;
	As_Put_Line("Please enter a number between 0 to a 1000");
      end loop;
      -- This is the procedure call that uses two inputs we got from the user
      -- and there are two ouputs, namely  I and Res
      NkiresProc(N, K, I, Res);
      -- The outputs are then displayed to the user
      AS_Put("I = ");
      AS_Put_Line(I);
      AS_Put("Res = ");
      AS_Put_Line(Res);
      -- This loop used to exit the program
      loop
	As_Put("Do you want to try again (y/n)? ");
	As_Get_Line(User_Input, Last);
	exit when Last > 0;
	As_Put_Line("Please enter a non-empty string");
      end loop;
      exit when User_Input(1 .. 1) = "n";
      
   end loop;    
end Main;


