if not surface_exists(shadow_surface_){
	shadow_surface_ = surface_create(room_width, room_height);
	surface_set_target(shadow_surface_);
	draw_clear_alpha(c_black, 0);
	
	for(var _y=0; _y < height_-1; _y++){
		for(var _x=0; _x < width_-1; _x++){
			if(grid_[# _x, _y] == FLOOR && grid_[# _x, _y-1] == VOID){
				draw_sprite_ext(sptShadowOne, 0, _x*CELL_WIDTH, (_y*CELL_HEIGHT)-2, 1, 1, 0, c_white, 0.7);
			}
		}
	}
	surface_reset_target();
}
draw_surface(shadow_surface_, 0, 0);


//var grid_check = array_create(9);
//grid_check[0] = grid_[# _x-1, _y-1]; //upper left
//grid_check[1] = grid_[# _x, _y-1]; //upper
//grid_check[2] = grid_[# _x+1, _y-1]; //upper right
//grid_check[3] = grid_[# _x-1, _y]; //left
//grid_check[4] = grid_[# _x, _y]; //current
//grid_check[5] = grid_[# _x+1, _y]; //right
//grid_check[6] = grid_[# _x-1, _y+1]; //bottom left
//grid_check[7] = grid_[# _x, _y+1]; //bottom
//grid_check[8] = grid_[# _x+1, _y+1]; //bottom right