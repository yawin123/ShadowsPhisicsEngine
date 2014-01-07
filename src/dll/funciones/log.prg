function log(string cadena)
	begin
		if(glog)
			say(cadena);
			if(!pf)
				pf=fopen("logs/log_"+ftime("%d%m%Y%H%M%S",time())+".yawlog",2);
			end
			fputs(pf,cadena);
		end
	end

function flog(string cadena)
	begin
		if(f_log)
			say(cadena);
			if(!pf)
				pf=fopen("logs/f_log_"+ftime("%d%m%Y%H%M%S",time())+".yawlog",2);
			end
			fputs(pf,cadena);
		end
	end

function plog(string cadena)
	begin
		if(glog)
			say(cadena);
			if(!pf)
				pf=fopen("logs/log_"+ftime("%d%m%Y%H%M%S",time())+".yawlog",2);
			end
			fputs(pf,cadena);

			while(!key(_seleccionar)) frame; end
			while(key(_seleccionar)) frame; end
		end
	end
