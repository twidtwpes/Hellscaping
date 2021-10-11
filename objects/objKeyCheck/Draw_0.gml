if(sprite_index != -1){
	if(selected){
		shader_set(shdBlack);

		x = xx - offset;
		y = yy;
		draw_self();
		x = xx + offset;
		y = yy;
		draw_self();
		x = xx;
		y = yy - offset;
		draw_self();
		x = xx;
		y = yy + offset;
		draw_self();

		shader_reset();
	}
	x = xx;
	y = yy;
	draw_self();
}