/*
  En este archivo se especifican las "tuplas", las
  constantes y las variables globales
*/

/* Tupla que define un elemento de una lista dinámica */
	type _fuer
		int angulo;  /* Angulo */
		int magnitud; /* Magnitud de la fuerza  */
	end
	type _lista
		_fuer fuerza;
		_lista* siguiente; /* Elemento siguiente */
	end

const
	modo_x=1280;
	modo_y=720;
	M_PI=3.14159265;
end
global 
	int modo_ventana=1;

	/* Control global de los logs */
		int glog=false;
		int f_log=false;
		int pf;
		
	/* Recursos */
		int fpgs[7],fnts[3],snds[2],cancs[2],cbatalla;
		string lang="es_ES";
	
	/* Controles */
		int _menuizquierda, _menuderecha, _menuarriba, _menuabajo; 					/* Menú 		 */
		int _izquierdapersonaje, _derechapersonaje, _arribapersonaje, _abajopersonaje;			/* Personaje 		 */
		int _alt_izquierdapersonaje, _alt_derechapersonaje, _alt_arribapersonaje, _alt_abajopersonaje;	/* Personaje alternativo */
		int _seleccionar, _escape, _espacio;								/* General		 */
	
	/* Control de ejecución */
		int ganimacion;				/* Si está en true se bloquean los controles 	   */
		int mapid,desv_x,scroll_graph;		/* ID del mapa, desviación de la pantalla y scroll */
		int personajeid;			/* ID del proceso de pintado del personaje	   */
		int graph_general,graph_dur,backgraph;	/* Gráfico del mapa y dureza del mapa		   */
		int sonando=-2,volumen=100;		/* Id de la canción que está sonando		   */
		int glob_i=0;				/* Variable i global				   */
		_fuer v_gravedad;				/* Gravedad					   */

	/* Control de personaje */
		int xper,yper,oper,flagper;
end 
local
	int menutype; 		    	  /* Si es un menú esta variable contendrá un valor de 1 en adelante 	    */
	int mirada,anim_cont=0, 	  /* Contienen la orientación, un contador para la animación		    */
	int id_obj; 		    	  /* Identificador de objeto 						    */
	int grafico,frames,orientaciones; /* Identificador del gráfico del gameobject o personaje, número de frames
							     de su animación y número de orientaciones del gráfico  */
	_fuer inercia[2];		  /* Velocidad								    */
	_lista* fuerzas;		  /* Fuerzas								    */
end
