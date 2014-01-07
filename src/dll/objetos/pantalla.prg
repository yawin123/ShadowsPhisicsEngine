process pantalla()
	begin
		x=modo_x/2;
		y=modo_y/2;
		z=100;

		scroll[0].camera=0;
		graph=scroll_graph;
		
		repeat
			x=(modo_x/2)+desv_x;
			frame;
		until(mapid==0)

	OnExit
		stop_scroll(0);
	end

function cambiar_grafico_mapa(int mapa)
	begin
		graph_dur=buscar("graph_dur",1,mapa);
		graph_general=buscar("graph",1,mapa);
		backgraph=buscar("backgraph",1,mapa);

		stop_scroll(0);
		start_scroll(0,fpgs[3],graph_general,backgraph,0,12,0,scroll_graph);
	end
