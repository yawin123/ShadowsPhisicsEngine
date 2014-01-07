/*
  Este archivo contiene el menú principal
*/
function llamar_mainmenu()
	begin
		mapid=0;
	end

function mainmenu()
	private
		int curs; /* Aqui se guarda el id del proceso "cursor" */
		string texto;
		int i;
		int opc_coord[3][2];
	end
	begin
		cambiar_musica(0);
		
		/* Fundido desde negro */
			fade(100,100,100,30);
			while(fading)
				frame;
			end
			
		menutype=1;
		log("Entrando en... menu principal");
				
		screen_put(fpgs[1],1);
		curs=cursor();
		
		/* Generamos las opciones del menú */
			for(i=0;i<3;i++)
				x=buscar(i+"x",0,-1); 
				y=buscar(i+"y",0,-1); 
				texto=buscar(i+"txt",0,-1); 

				write(fnts[0],x,y,5,texto);
				opc_coord[i][0]=x;
				opc_coord[i][1]=y;
			end
		
		/* Ponemos el cursor en la primera opción*/
			curs.x=opc_coord[0][0]+50;
			curs.y=opc_coord[0][1];

		i=0;
		loop
			if(key(_seleccionar))					
				while(key(_seleccionar))
					frame;
				end
				break;
			end
			if(key(_menuabajo) || key(_abajopersonaje))				
				i++;
				if(i>2)
					i=0;
				end
				
				while(key(_menuabajo) || key(_abajopersonaje))
					frame;
				end
			end
			if(key(_menuarriba) || key(_arribapersonaje))				
				i--;
				if(i<0)
					i=2;
				end
				
				while(key(_menuarriba) || key(_arribapersonaje))
					frame;
				end
			end
				
			/* Ponemos el cursor en la altura seleccionada*/
				curs.y=opc_coord[i][1];
			frame;
		end
			
		/* Hacemos un fundido a negro */
			fade(0,0,0,30);
			while(fading)
				frame;
			end
		return i;
	OnExit
		signal(curs,s_kill);
		delete_text(0);
		clear_screen();
	end
	
function optionmenu()
	private
		int curs; /* Aqui se guarda el id del proceso "cursor" */
		string texto;
		int i,j;
		int opc_coord[3][2];
	end
	begin
		/* Fundido desde negro */
			fade(100,100,100,30);
			while(fading)
				frame;
			end
		menutype=2;
		log("Entrando en... menu de opciones");

		file=fpgs[1];
		screen_put(fpgs[1],1);
		curs=cursor();
		
		/* Generamos las opciones del menú */
			for(i=0;i<4;i++)
				x=buscar(i+"x",0,-1); 
				y=buscar(i+"y",0,-1); 
				texto=buscar(i+"txt",0,-1); 

				write(fnts[0],x,y,5,texto);
				opc_coord[i][0]=x;
				opc_coord[i][1]=y;
			end
		
		/* Ponemos el cursor en la primera opción */
			curs.x=opc_coord[0][0]+50;
			curs.y=opc_coord[0][1];

		j=0;
		repeat
			loop
				/* Ponemos el cursor en la primera opción */
					curs.x=opc_coord[j][0]+50;
					curs.y=opc_coord[j][1];

				
				if(key(_seleccionar))					
					while(key(_seleccionar))
						frame;
					end
					break;
				end
				if(key(_menuabajo) || key(_abajopersonaje))				
					j++;
					if(j>3)
						j=0;
					end
				
					while(key(_menuabajo) || key(_abajopersonaje))
						frame;
					end
				end
				if(key(_menuarriba) || key(_arribapersonaje))				
					j--;
					if(j<0)
						j=3;
					end
				
					while(key(_menuarriba) || key(_arribapersonaje))
						frame;
					end
				end		
				frame;
			end
			
			curs.graph=0;
			signal(curs,s_freeze);
			delete_text(0);
			switch(j)
				case 0:
					x=modo_x/2;
					y=modo_y/2;
					graph=2;
					/*optionpanel(3);*/
					graph=0;
				end
				case 1:
					x=modo_x/2;
					y=modo_y/2;			
					graph=2;
					/*optionpanel(4);*/
					graph=0;
				end
				case 2:					
					/* Reiniciar la partida*/
					log("Partida reiniciada");
					j=3;
				end
			end	
			
			/* Generamos las opciones del menú
				for(i=1;i<=4;i++)
					texto=buscar(i,2); write(fnts[0],x,y,5,texto);
					opc_coord[i-1][0]=x;
					opc_coord[i-1][1]=y;
				end
			*/

			signal(curs,s_wakeup);
			curs.graph=4;
		until(j==3 || key(_escape))
		while(key(_escape)) frame; end

		/* Hacemos un fundido a negro */
			fade(0,0,0,30);
			while(fading)
				frame;
			end
	OnExit
		signal(curs,s_kill);
		delete_text(0);
	end
