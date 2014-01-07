/*
  En este archivo se especifican las "tuplas", las
  constantes y las variables globales
*/

/* Tupla que define un elemento de una lista din�mica */
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
		int _menuizquierda, _menuderecha, _menuarriba, _menuabajo; 					/* Men� 		 */
		int _izquierdapersonaje, _derechapersonaje, _arribapersonaje, _abajopersonaje;			/* Personaje 		 */
		int _alt_izquierdapersonaje, _alt_derechapersonaje, _alt_arribapersonaje, _alt_abajopersonaje;	/* Personaje alternativo */
		int _seleccionar, _escape, _espacio;								/* General		 */
	
	/* Control de ejecuci�n */
		int ganimacion;				/* Si est� en true se bloquean los controles 	   */
		int mapid,desv_x,scroll_graph;		/* ID del mapa, desviaci�n de la pantalla y scroll */
		int personajeid;			/* ID del proceso de pintado del personaje	   */
		int graph_general,graph_dur,backgraph;	/* Gr�fico del mapa y dureza del mapa		   */
		int sonando=-2,volumen=100;		/* Id de la canci�n que est� sonando		   */
		int glob_i=0;				/* Variable i global				   */
		_fuer v_gravedad;				/* Gravedad					   */

	/* Control de personaje */
		int xper,yper,oper,flagper;
end 
local
	int menutype; 		    	  /* Si es un men� esta variable contendr� un valor de 1 en adelante 	    */
	int mirada,anim_cont=0, 	  /* Contienen la orientaci�n, un contador para la animaci�n		    */
	int id_obj; 		    	  /* Identificador de objeto 						    */
	int grafico,frames,orientaciones; /* Identificador del gr�fico del gameobject o personaje, n�mero de frames
							     de su animaci�n y n�mero de orientaciones del gr�fico  */
	_fuer inercia[2];		  /* Velocidad								    */
	_lista* fuerzas;		  /* Fuerzas								    */
end
