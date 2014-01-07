/*
  Este archivo contiene el proceso que controla la ejecución
*/
process control()
	private
		int cont,i,salto=false;
	end
	begin
		loop
			if(key(_escape))
				if(mapid>0)
					llamar_mainmenu();
					while(key(_escape)) frame; end
				else
					if(exists(type optionmenu))
						while(key(_escape)) frame; end
						signal(type optionmenu,s_kill_tree);
					else
						let_me_alone();
						exit(0);
					end
				end
			end
			
			if(ganimacion!=true && exists(personajeid))
				if(glog)
					if(key(_F1))
						
						while(key(_F1)) frame; end
					end
					if(key(_F2))
						
						while(key(_F2)) frame; end
					end
					if(key(_F3))
						
						while(key(_F3)) frame; end
					end
					if(key(_F4))
						/*volumen_musica(10);*/
						while(key(_F4)) frame; end
					end
					if(key(_F5))
						/*volumen_musica(100);*/					
						while(key(_F5)) frame; end
					end
					if(key(_F6))
											
						while(key(_F6)) frame; end
					end
					if(key(_F7))
											
						while(key(_F7)) frame; end
					end
					if(key(_F8))
						
						while(key(_F8)) frame; end
					end
					if(key(_F9))
						
						while(key(_F9)) frame; end
					end
					if(key(_F12))
						
						while(key(_F12)) frame; end
					end
				end
				
				if(key(_arribapersonaje) || key(_alt_arribapersonaje) && !key(_abajopersonaje) && !key(_alt_abajopersonaje))

				elsif(key(_abajopersonaje) || key(_alt_abajopersonaje) && !key(_arribapersonaje) && !key(_alt_arribapersonaje))

				elsif(key(_izquierdapersonaje) || key(_alt_izquierdapersonaje) && !key(_arribapersonaje) && !key(_abajopersonaje) && !key(_derechapersonaje) && !key(_alt_arribapersonaje) && !key(_alt_abajopersonaje) && !key(_alt_derechapersonaje))
					mover(true,5,personajeid);
				elsif(key(_derechapersonaje) || key(_alt_derechapersonaje) && !key(_arribapersonaje) && !key(_abajopersonaje) && !key(_izquierdapersonaje) && !key(_alt_arribapersonaje) && !key(_alt_abajopersonaje) && !key(_alt_izquierdapersonaje))
					mover(false,5,personajeid);
				end

				if(key(_espacio) && !salto)
					salto(50,personajeid);
					salto=true;
				elsif(!key(_espacio))
					salto=false;
				end
			end
			
			frame;
		end
	end
