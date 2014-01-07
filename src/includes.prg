/*
  En este archivo se especifican los archivos
  fuente del videojuego para incluirlos
*/

/*Declaraciones*/
	declare function string buscar(string cadena, int fich, int aux) end

/*Sistema*/
	include "dll/funciones/globales.prg";
	include "dll/funciones/log.prg";
	include "dll/funciones/configuracion.prg";
	include "dll/funciones/controles_ejecucion.prg";
	include "dll/funciones/animaciones.prg";
	include "dll/funciones/libfile.prg";
	include "dll/funciones/fisica.prg";
	include "dll/funciones/busqueda.prg";
	
/*Objetos*/
	include "dll/objetos/pantalla.prg";
	include "dll/objetos/cursor.prg";
	include "dll/objetos/personaje.prg";
	include "dll/objetos/musica.prg";
	
/*Escenas*/
	include "dll/escenas/presentacion.prg";
	include "dll/escenas/menu.prg";
	include "dll/escenas/juego.prg";
	
