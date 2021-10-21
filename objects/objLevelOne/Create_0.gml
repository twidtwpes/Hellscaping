randomize();

hornet_range = round(objSettings_Tracker.enemie_ranges[0] * objSettings_Tracker.ememie_multiplier);
demon_range = round(objSettings_Tracker.enemie_ranges[1] * objSettings_Tracker.ememie_multiplier);
fetus_range = round(objSettings_Tracker.enemie_ranges[2] * objSettings_Tracker.ememie_multiplier);
water_range = round(objSettings_Tracker.enemie_ranges[3] * objSettings_Tracker.ememie_multiplier);

objSettings_Tracker.level_load = rmLevelOne;

portal = false;
pause = false;
dead = false;
spt_screenshot = noone;
pause_select = 0;
dead_select = 0;
confirm = false;
confirm_option = 0;
screenshot_scale = 1;

continue_x = 42;
continue_y = 184
continue_w = sprite_get_width(sptPause_Continue);
continue_h = sprite_get_height(sptPause_Continue);
retry_x = 74;
retry_y = 248
retry_w = sprite_get_width(sptPause_Retry);
retry_h = sprite_get_height(sptPause_Retry);
settings_x = 278;
settings_y = 184
settings_w = sprite_get_width(sptPause_Settings);
settings_h = sprite_get_height(sptPause_Settings);
quit_x = 310;
quit_y = 248
quit_w = sprite_get_width(sptPause_Quit);
quit_h = sprite_get_height(sptPause_Quit);
no_x = 102;
no_y = 184;
no_w = sprite_get_width(sptMenu_No);
no_h = sprite_get_height(sptMenu_No);
yes_x = 298;
yes_y = 184;
yes_w = sprite_get_width(sptMenu_Yes);
yes_h = sprite_get_height(sptMenu_Yes);


menu_fg_start = 1.4;
menu_fg_end = 1;
menu_fg_current = menu_fg_start;
menu_fg_amount = 0.05;

shadow_surface_ = noone;

// Get the tile layer map id
var _wall_map_edge_id = layer_tilemap_get_id("WallTilesEdge");
var _wall_map_front_id = layer_tilemap_get_id("WallTilesFront");
var _wall_map_back_id = layer_tilemap_get_id("WallTilesBack");
//var _wall_map_clear_id = layer_get_id("FloorClear");

// Set up the grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_,height_);
ds_grid_set_region(grid_,0,0,width_,height_,VOID);

// Create the controller
var _controller_x = width_ div 2;
var _controller_y = height_ div 2;
var _controller_direction = irandom(3);
var _steps = grid_amount;

//var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2;
//var _player_start_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT/2;
//instance_create_layer(_player_start_x, _player_start_y, "Todd", objTodd);

var _direction_change_odds = 1;

repeat (_steps){
	grid_[# _controller_x, _controller_y] = FLOOR;
	
	// Randomize the direction
	if(irandom(_direction_change_odds) == _direction_change_odds){
		_controller_direction = irandom(3);
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1,_controller_direction * 90);
	var _y_direction = lengthdir_y(1,_controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Maker sure we don't go outside the grid
	if(_controller_x < 10 || _controller_x >= width_ - 10){
		_controller_x += -_x_direction * 10;
	}
	if(_controller_y < 10 || _controller_y >= height_ - 10){
		_controller_y += -_y_direction * 10;
	}
}

//// Removing single tiles
//for(var _y = 1; _y < height_-1; _y++){
//	for(var _x = 1; _x < width_ - 1; _x++){
//		if(grid_[# _x, _y] != FLOOR){
//			var _north_tile = grid_[# _x,_y-1] == VOID;
//			var _west_tile = grid_[# _x-1,_y] == VOID;
//			var _east_tile = grid_[# _x+1,_y] == VOID;
//			var _south_tile = grid_[# _x,_y+1] == VOID;
			
//			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
//			if(_tile_index == 1) grid_[# _x,_y] = FLOOR;
//		}
//	}
//}


//Place extra tiles
for(var _n = 1; _n < 400; _n++){
		var extra_x = (irandom_range(0, width_-1) * CELL_WIDTH) - 2;
		var extra_y = (irandom_range(0, height_-1) * CELL_WIDTH) - 2;
		instance_create_layer(extra_x, extra_y, "FloorExtra", objFloorExtraOne);
}

//Place extra objects
var _t = irandom_range(5,10);
for(var _n = 1; _n < _t; _n++){
		var grid_x = irandom_range(1, width_-1);
		var grid_y = irandom_range(1, height_-1);
		if(grid_[# grid_x, grid_y] == FLOOR){
			var extra_x = grid_x * CELL_WIDTH + CELL_WIDTH/2;
			var extra_y = grid_y * CELL_WIDTH + CELL_WIDTH/2;
			instance_create_layer(extra_x, extra_y, "ExtraObjects", objGate2One);
			knock_out_walls(grid_, grid_x, grid_y);
		}
}

// Getting available tiles
floor_list = ds_list_create();
floor_used_list = ds_list_create();
for(var _y = 1; _y < height_-1; _y++){
	for(var _x = 1; _x < width_ - 1; _x++){
		if(grid_[# _x, _y] == FLOOR) ds_list_add(floor_list, [_x,_y]);
	}
}

// Placing tiles
for(var _y = 1; _y < height_-1; _y++){
	for(var _x = 1; _x < width_ - 1; _x++){
		if(grid_[# _x, _y] != FLOOR){
			var _north_tile = grid_[# _x,_y-1] == VOID;
			var _west_tile = grid_[# _x-1,_y] == VOID;
			var _east_tile = grid_[# _x+1,_y] == VOID;
			var _south_tile = grid_[# _x,_y+1] == VOID;
			
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			tilemap_set(_wall_map_back_id,_tile_index,_x,_y);
			tilemap_set(_wall_map_front_id,_tile_index,_x,_y);
			
			if(grid_[# _x-1,_y] == FLOOR && grid_[# _x,_y+1] == VOID){
				_tile_index = choose(1,2);
				tilemap_set(_wall_map_edge_id,_tile_index,_x-1,_y);
			}
			if(grid_[# _x-1,_y] == FLOOR && grid_[# _x,_y+1] == FLOOR){
				_tile_index = choose(3,4);
				tilemap_set(_wall_map_edge_id,_tile_index,_x-1,_y);
			}
			if(grid_[# _x+1,_y] == FLOOR && grid_[# _x,_y+1] == VOID){
				_tile_index = choose(5,6);
				tilemap_set(_wall_map_edge_id,_tile_index,_x+1,_y);
			}
			if(grid_[# _x+1,_y] == FLOOR && grid_[# _x,_y+1] == FLOOR){
				_tile_index = choose(7,8);
				tilemap_set(_wall_map_edge_id,_tile_index,_x+1,_y);
			}
		}else{
			ds_list_add(floor_list, [_x,_y]);
		}
	}
}

//Place Todd
var list_value = get_empty_floor(self);
var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2;
var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2;
instance_create_layer(start_x, start_y, "Todd", objTodd);
objTodd.hp = objSettings_Tracker.hp;
knock_out_walls(grid_, list_value[0], list_value[1]);

//Place enemies
enemy_types = [objHornet, objDemon, objFetusPod, objWater];
enemy_counts = [hornet_range, demon_range, fetus_range, water_range];
//enemy_counts = [0,0,0,0];
enemy_layers = ["EnemiesFlying", "EnemiesGrounded", "EnemiesGrounded", "EnemiesUnderground"];
enemy_offset = [[0,0], [0,0], [0,0], [-(CELL_WIDTH/2),-(CELL_HEIGHT/2)]];
enemy_knockout = [false, true, false, true];
for(var i = 0; i < array_length(enemy_types); i++){
	for(var j = 1; j <= enemy_counts[i]; j++){
		do{
			var list_value = get_empty_floor(self);
		}until(!collision_circle(list_value[0], list_value[1], 128, objTodd, false, true))
		var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2 + enemy_offset[i][0];
		var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2 + enemy_offset[i][1];
		instance_create_layer(start_x, start_y, enemy_layers[i], enemy_types[i]);
		if(enemy_knockout[i]) knock_out_walls(grid_, list_value[0], list_value[1]);
	}
}

//Place pickups
pickup_types = [objWeapons_Box, objSpecial_Box, objUltra_Box, objAmmo_MiniLocker, objWeapons_MiniLocker, objSpecial_MiniLocker, objUltra_MiniLocker];
pickup_counts = [irandom_range(0,0),irandom_range(1,1),irandom_range(1,1),irandom_range(0,1),irandom_range(0,1),irandom_range(2,4),irandom_range(0,0)];
enemy_knockout = [false, false, false, true, true, true, true];
for(var i = 0; i < array_length(pickup_types); i++){
	for(var j = 1; j <= pickup_counts[i]; j++){
		var list_value = get_empty_floor(self);
		var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2 -(CELL_WIDTH/2);
		var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2 -(CELL_HEIGHT/2);
		instance_create_layer(start_x, start_y, "Pickups", pickup_types[i]);
		if(enemy_knockout[i]) knock_out_walls(grid_, list_value[0], list_value[1]);
	}
}

if(objSettings_Tracker.hp < 3){
	var medkit = irandom(2);
	if(medkit == 2){
		var list_value = get_empty_floor(self);
		var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2 -(CELL_WIDTH/2);
		var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2 -(CELL_HEIGHT/2);
		instance_create_layer(start_x, start_y, "Pickups", objMedKit);
	}
}
