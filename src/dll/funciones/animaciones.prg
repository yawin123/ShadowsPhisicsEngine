/*  Este archivo contiene las funciones de animaciones*/function char_calc(int fpg_id,int graph_orig,int pos1,int pos2,int frames,int orientaciones)	private		int i,j,cant_x,cant_y;		int x_inic, y_inic;	end	begin		cant_x=map_info(fpgs[fpg_id],graph_orig,G_WIDTH)/frames;		cant_y=map_info(fpgs[fpg_id],graph_orig,G_HEIGHT)/orientaciones;		graph=map_new(cant_x,cant_y,16);				y_inic=cant_y*pos1;		x_inic=cant_x*pos2;				for(i=0;i<cant_x;i++)			for(j=0;j<cant_y;j++)				map_put_pixel(0,graph,i,j,map_get_pixel(fpgs[fpg_id],graph_orig,x_inic+i,y_inic+j));			end		end			father.graph=graph;	end