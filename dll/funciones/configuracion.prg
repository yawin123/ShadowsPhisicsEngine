/*
  Este archivo contiene las funciones de configuración
*/
function logging()
	begin
		if(fexists("ywn.ai"))
			glog=true;
			modo_ventana=1;
		else
			glog=false;
			modo_ventana=0;
		end
	end
	
function resolucion()
	private
		int escala;
	end
	begin
		escala=12800720;
		scale_resolution=escala;
		
		if(modo_ventana!=0)
			set_mode(modo_x,modo_y,16,MODE_WINDOW);
		else
			set_mode(modo_x,modo_y,16,MODE_FULLSCREEN);
		end
		log("Resolución configurada en "+escala);
	end

function cargar_fpgs()
	private
		string ruta;
	end
	begin
		ruta="dll/fpgs/";
		fpgs[0]=load_fpg(ruta+"common.fpg");
		fpgs[1]=load_fpg(ruta+"menus.fpg");
		fpgs[2]=load_fpg(ruta+"characters.fpg");
		fpgs[3]=load_fpg(ruta+"maps.fpg");
		fpgs[4]=load_fpg(ruta+"gameobjects.fpg");
		fpgs[5]=load_fpg(ruta+"spsc.fpg");
		log("FPGs cargados en la ruta "+ruta);
	end

function cargar_fnts()
	private
		string ruta;
	end
	begin
		ruta="dll/fnts/";
		fnts[0]=load_fnt(ruta+"maintitle.fnt");
		fnts[1]=load_fnt(ruta+"ingame (tnr-40).fnt");
		fnts[2]=load_fnt(ruta+"ingame (tnr-30).fnt");
		log("FNTs cargados en la ruta "+ruta);
	end	

function cargar_snds()
	private
		string ruta;
	end
	begin
		ruta="dll/snds/";
		
		/*SoundFXs*/
			snds[0]=load_wav(ruta+"sndfx1.ogg");
		
		/*Canciones*/
			cancs[0]=load_song(ruta+"mainmenu.mp3");
			cancs[1]=load_song(ruta+"1.ogg");

		/*Canción de batalla*/
			cbatalla=load_song(ruta+"battle.mp3");
			
		log("Audio cargado en la ruta "+ruta);
	end
	
function cargar_lang()
	begin
		lang="es_ES";
		log("Lenguaje cargado "+lang);
	
	end
	
function cargar_controles()
	begin
		_menuizquierda=_left; log("_menuizquierda="+_menuizquierda);
		_menuderecha=_right; log("_menuderecha="+_menuderecha);
		_menuarriba=_up; log("_menuarriba="+_menuarriba);
		_menuabajo=_down; log("_menuabajo="+_menuabajo);
		
		_izquierdapersonaje=_a; log("_izquierdapersonaje="+_izquierdapersonaje);
		_derechapersonaje=_d; log("_derechapersonaje="+_derechapersonaje);
		_arribapersonaje=_w; log("_arribapersonaje="+_arribapersonaje);
		_abajopersonaje=_s; log("_abajopersonaje="+_abajopersonaje);
		
		_alt_izquierdapersonaje=_left; log("_alt_izquierdapersonaje="+_alt_izquierdapersonaje);
		_alt_derechapersonaje=_right; log("_alt_derechapersonaje="+_alt_derechapersonaje);
		_alt_arribapersonaje=_up; log("_alt_arribapersonaje="+_alt_arribapersonaje);
		_alt_abajopersonaje=_down; log("_alt_abajopersonaje="+_alt_abajopersonaje);
		
		_seleccionar=_enter; log("_seleccionar="+_seleccionar);
		_escape=_esc; log("_escape="+_escape);
		_espacio=_space; log("_espacio="+_space);
	end
	
/*
  A partir de aquí están las funciones para guardar la configuración
*/

