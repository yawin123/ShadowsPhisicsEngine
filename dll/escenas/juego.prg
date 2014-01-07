/*
  Este archivo contiene el juego (en lineas generales)
*/

function cargapantalla()
	private
		int i,j;
	end
	begin
		/* Asignamos gráfico y dureza*/
			cambiar_grafico_mapa(mapid);

		/* Asignamos la música*/
			cambiar_musica(buscar("cancion",1,mapid));
	
		/* Creamos los gameobjects */
			/*j=buscar("contar",5);
			for(i=0;i<j;i++)
				gameobject(i+1);
			end*/			
			
		/* Creamos el personaje */
			xper=buscar("xper",1,mapid);
			yper=buscar("yper",1,mapid);
			oper=buscar("oper",1,mapid);

			personajeid=personaje();
			
		/* Cargamos la gravedad*/
			v_gravedad.angulo=buscar("grav_ang",1,mapid);
			v_gravedad.magnitud=buscar("grav_mag",1,mapid);

		/* Asignamos la cÃ¡mara */
			scroll[0].camera=personajeid;

	end

function juego()
	private
		int mapa,i,j;
	end
	begin
		log("Entrando en... juego");
		
		/* Inicializamos el scroll */
			scroll_graph=new_map(modo_x,modo_y,16);
			start_scroll(0,0,0,0,0,0,0,scroll_graph);
			pantalla();

		repeat
			fade_on();
			/* Bloqueamos los controles */
				ganimacion=true;
				
			/* Recojemos el mapa a cargar y creamos su scroll */
				mapa=mapid;

				cargapantalla();

			/* Desbloqueamos los controles */
				ganimacion=false;
			
			fade_on();
			repeat
				frame;
			until(mapid!=mapa)
			
			/* Congelamos los procesos, para fundir en negro sin
			que desaparezcan*/
				//signal(type gameobject,s_freeze_tree);
				signal(personajeid,s_freeze_tree);
			
			/* Hacemos un fundido a negro */
				fade(0,0,0,30);
				while(fading)
					frame;
				end
			
			/* Bloqueamos los controles */
				ganimacion=true;
			
			/* Matamos los procesos abiertos */
				//signal(type gameobject,s_kill_tree);
				signal(personajeid,s_kill_tree);
				
			/* Borramos cualquier texto que pueda quedar escrito */
				delete_text(0);
				
			/* Actualizamos los datos del personaje */
				/*guardar();*/
			
		until(mapid==0)
		signal(type pantalla,s_kill_tree);
	end
