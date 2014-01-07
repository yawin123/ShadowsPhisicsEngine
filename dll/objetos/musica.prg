function cambiar_musica(int cancion)
	begin
		sonando=cancion;
	end

function volumen_musica(int volumen)
	begin
		set_song_volume(volumen);
	end
	
function reproducir_sonido(int sonido)
	begin
		Play_wav(snds[sonido],0);
		log("Ejecutando sonido "+sonido);
	end

process musica()
	private
		int canc;
		int i;
	end
	begin
		loop
			canc=sonando;
			if(sonando>-1)
				while(is_playing_song()) frame; end
				log("Cargando canci�n "+sonando);
				set_song_volume(volumen);
				Play_song(cancs[sonando],-1);
			elseif(sonando==-1)
				while(is_playing_song()) frame; end
				log("Cargando canci�n de batalla");
				set_song_volume(volumen);
				Play_song(cbatalla,-1);
			end
			
			repeat
				frame;
			until (canc!=sonando)
			
			if(sonando>-1)
				for(i=0;i<volumen;i+=3)
					set_song_volume(volumen-i);
					frame;
				end
			end
			stop_song();
		end
	end
