/*
  Este archivo contiene el cursor señalador
*/

process cursor()
	begin
		x=-10;
		file=fpgs[0];
		graph=4;
		
		if(father.menutype==5 || father.menutype==-1)
			flags=0;
		else
			flags=1;
		end
		z=-1;
		loop
			frame;
		end
	end