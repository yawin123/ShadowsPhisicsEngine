/*
  Este archivo contiene el personaje
*/
function teletransportar(int x, int y, int z)
	begin
		xper=x;
		yper=y;
		oper=z;		
	end
process personaje()
	private
		int graf_orig;
		_fuer aux;
		bool salto=false;
	end
	begin
		id_obj=0;
		ctype=1;		
		x=xper;
		y=yper;
		flags=flagper;
		
		grafico=1;
		z=-1;
		frames=4;
		orientaciones=3;
		size=35;

		/* Inicializamos las inercias */
			inic_inercias();

		loop			
			x=xper;
			y=yper;
			mirada=oper;
			flags=flagper;
			angle=(v_gravedad.angulo+90)*1000;

			/*anim_cont++;
			if(anim_cont>3)
				anim_cont=0;
			end*/

			if(grafico>0)
				char_calc(2,grafico,mirada,anim_cont,frames,orientaciones);
				center_set(0,graph,map_info(0,graph,G_WIDTH)/2,map_info(0,graph,G_HEIGHT));	
			end

			/* Aplicamos fuerzas */
				gravedad();

			/* Resolvemos fuerzas*/
				resuelve_fuerzas();


			/* Comprobamos las colisiones con el terreno */
				if(det_colision(inercia[0].magnitud,inercia[1].magnitud, xper, yper))

					/* La inercia ha sido modificada así que colocamos al personaje en su nuevo destino*/
						xper+=inercia[0].magnitud;
						yper+=inercia[1].magnitud;

					/* Descargamos las fuerzas */
						descargar_fuerzas(); /* Porque la inercia contiene otras fuerzas */

					/* Ponemos a 0 la inercia */
						inercia[0].magnitud=0;
						inercia[1].magnitud=0;

				else
					/* La inercia está intacta así que colocamos al personaje en su destino*/
						xper+=inercia[0].magnitud;
						yper+=inercia[1].magnitud;

					/* Descargamos las fuerzas */
						descargar_fuerzas(); /* Porque la inercia ya contiene todas las fuerzas */
				end

			frame;

			/*while(!key(_enter)) frame; end
			while(key(_enter)) frame; end*/
		end
	OnExit
		descargar_fuerzas();
	end
