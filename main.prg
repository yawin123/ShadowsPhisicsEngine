/*
  Este es el archivo principal desde donde se llama a todo lo necesario
*/

include "imports.prg";
include "includes.prg";

process main()
	private
		int opc;
	end
	begin
		logging();  /* Proceso que decide si activar los logs */
		control(); 	/* Proceso de control de ejecución    */
			
		cargar_fpgs(); 	    /* Graficos;  */
		cargar_fnts();	    /* Fuentes;	  */
		cargar_snds();	    /* Audio;	  */
		cargar_lang();	    /* Idioma;	  */
		cargar_controles(); /* Controles; */
	
		if(!glog) presentacion(); end /* Splashscreens */
	
		resolucion(); /* Seteamos la resolución del juego  */
		set_fps(60,1); /* Establece los frames por segundo */
		
		/* Activamos la música */
			if(!glog) musica(); else musica(); end
			
		loop
			opc=mainmenu();
			switch(opc)
				case 0:
					/* 
						carga();
						juego();
					*/
				end
				case 1:
					/* Datos de inicio de partida */
						mapid=1;

					juego();
				end
				case 2:
					let_me_alone();
					exit(0);
				end
			end
		end
	end 
