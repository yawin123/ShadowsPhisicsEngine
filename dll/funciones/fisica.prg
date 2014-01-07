/*
	Este fichero contiene funciones para añadir, eliminar y aplicar fuerzas
*/

function gravedad()
	begin
		anadir_fuerza(v_gravedad,father.id);
	end

function salto(int mag,int id_obj)
	private
		_fuer aux;
	end
	begin
		aux.angulo=-v_gravedad.angulo;
		aux.magnitud=v_gravedad.magnitud+mag;

		anadir_fuerza(aux,id_obj);
	end
function mover(int izda,int mag,int id_obj)
	private
		_fuer aux;
	end
	begin
		if(izda)
			aux.angulo=v_gravedad.angulo-90;
		else
			aux.angulo=v_gravedad.angulo+90;
		end

		aux.magnitud=mag;

		anadir_fuerza(aux,id_obj);
	end

function anadir_fuerza(_fuer frec,int id_obj)
	private
		_lista *nuevo; /* Guarda el puntero al nuevo elemento que vamos a añadir */
	end
	begin
		nuevo=alloc(sizeof(_lista));		/* Reservo la memoria						*/
		nuevo.fuerza=frec;			/* Asigno la fuerza que es					*/
		nuevo.siguiente=id_obj.fuerzas;	 	/* Asigno el puntero para que apunte al último elemento añadido */

		id_obj.fuerzas=nuevo;			/* Reasigno el puntero global para que apunte al nuevo 	 	*/
		flog("Cargada fuerza ["+id_obj.fuerzas.fuerza.angulo+", "+id_obj.fuerzas.fuerza.magnitud+"] al objeto "+id_obj);
	end

function descargar_fuerzas() /* Esta función descarga la lista de enemigos */
	private
		int i;
		_lista *actual; /* Guarda el elemento en el que nos situamos */
	end
	begin
		while(father.fuerzas != NULL)
			flog("Descargada fuerza["+father.fuerzas.fuerza.angulo+", "+father.fuerzas.fuerza.magnitud+"] del objeto "+father.id);

			actual=father.fuerzas; 		/* Recojemos el primer enemigo	*/
			free(father.fuerzas);		/* Liberamos el enemigo		*/
			father.fuerzas=actual.siguiente;/* Pasamos al siguiente enemigo	*/
		end
	end

function resuelve_fuerzas()
	private
		int i;
		_lista *actual;
		_fuer aux[2]; /*aux[0] es la fuerza en x y aux[1] es la fuerza en y*/
	end
	begin
		actual=father.fuerzas;	/* Recogemos la primera fuerza			*/
		while(actual != NULL)	/* Repetimos hasta que no queden más fuerzas	*/
			aux[0].magnitud=actual.fuerza.magnitud*cos(actual.fuerza.angulo*1000); /* Magnitud de x=magnitud(ro) por coseno del ángulo en radianes*/
			aux[1].magnitud=actual.fuerza.magnitud*sin(actual.fuerza.angulo*1000); /* Magnitud de y=magnitud(ro) por seno del ángulo en radianes*/

			father.inercia[0].magnitud+=(aux[0].magnitud);
			father.inercia[1].magnitud-=(aux[1].magnitud);

			actual=actual.siguiente; /* Pasamos a la siguiente fuerza */
		end
	end

function inic_inercias()
	begin
		father.inercia[0].angulo=0;
		father.inercia[1].angulo=180;

		father.inercia[0].magnitud=0;
		father.inercia[1].magnitud=0;		
	end

function det_colision(int velx,int vely,int x, int y)
	private
		int t,c[2][2],vel;
		int aux[2],i;
	end
	begin
		if(velx==0 && vely==0)
			return false;
		end

		/* Guardamos x0 y X1 */
			c[0][0]=x;
			c[0][1]=x+velx;

		/* Guardamos Y0 e Y1 */
			c[1][0]=y;
			c[1][1]=y+vely;

		/* Asignamos t */
			if(abs(velx)>abs(vely))
				t=abs(velx);
			else
				t=abs(vely);
			end

		/* Calculamos la velocidad */
			velx=(c[0][1]-c[0][0])/t;
			vely=(c[1][1]-c[1][0])/t;
		
		/* Recorremos la trayectoria buscando colisiones */
			for(i=0;i<=t;i++)
				if(velx!=0)
					c[0][1]=x;
					x=c[0][0]+(velx*i);
				end
				if(vely!=0)
					c[1][1]=y;
					y=c[1][0]+(vely*i);
				end

				if(map_get_pixel(fpgs[3],graph_dur,x,y)==rgb(255,255,255))
					father.inercia[0].magnitud=c[0][1]-(c[0][0]);
					father.inercia[1].magnitud=c[1][1]-(c[1][0]);
					return true;
				end
			end
		
		/* Si no ha pasado nada retornamos falso */
			return false;
	end
