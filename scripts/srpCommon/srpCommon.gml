//window_set_fullscreen(true);

//Tile Macros
#macro CELL_WIDTH 32
#macro CELL_HEIGHT 32
#macro FLOOR -5
//#macro ANY -6
#macro VOID -7

#macro NORTH 1
#macro WEST 2
#macro EAST 4
#macro SOUTH 8

#macro SETTINGSFILE "he.sav"
#macro STATSFILE "he.sts"
#macro PAUSEFILE "he.p"

//global.upperleft = [FLOOR, FLOOR, ANY, FLOOR, VOID, VOID, ANY, VOID, ANY];
//global.uppermid = [ANY, FLOOR, ANY, VOID, VOID, VOID, ANY, VOID, ANY];
//global.upperright = [ANY, FLOOR, FLOOR, VOID, VOID, FLOOR, ANY, VOID, ANY];
//global.middleleft = [ANY, VOID, ANY, FLOOR, VOID, VOID, ANY, VOID, ANY];
//global.middlemid = [VOID, VOID, VOID, VOID, VOID, VOID, VOID, VOID, VOID];
//global.middleright = [ANY, VOID, ANY, VOID, VOID, FLOOR, ANY, VOID, ANY];
//global.bottomleft = [ANY, VOID, ANY, VOID, VOID, FLOOR, ANY, VOID, ANY];

//function grid_tile_check(tile_grid, tile_x, tile_y, tile_array){

//}

function save_settings(){
	//Delete old save
	if(file_exists(SETTINGSFILE)) file_delete(SETTINGSFILE);

	//Find our savefile string
	var _save_string = json_encode(objSettings_Tracker.settings);

	//Make a hash (we're using the UTF-8 hash variant here)
	//SHA1 hash strings are exactly 40 characters long
	var _hash = sha1_string_utf8(_save_string);

	//Append the hash onto the string
	_save_string += "#" + _hash + "#";

	//Now save the string to a file
	var _file = file_text_open_write(SETTINGSFILE);
	file_text_write_string(_file, _save_string);
	file_text_close(_file);
	
	//Delete old save
	if(file_exists(STATSFILE)) file_delete(STATSFILE);

	//Find our savefile string
	var _save_string = json_encode(objSettings_Tracker.stats);

	//Make a hash (we're using the UTF-8 hash variant here)
	//SHA1 hash strings are exactly 40 characters long
	var _hash = sha1_string_utf8(_save_string);

	//Append the hash onto the string
	_save_string += "#" + _hash + "#";

	//Now save the string to a file
	var _file = file_text_open_write(STATSFILE);
	file_text_write_string(_file, _save_string);
	file_text_close(_file);
}

function load_hash(){
	//Load in the save string
	var file = file_text_open_read(SETTINGSFILE);
	var _save_string = file_text_read_string(file);
	file_text_close(file);

	//Find the hash tacked onto the end of the save string
	var _expected_hash = string_copy(_save_string, string_length(_save_string)-40, 40);

	//Trim off the hash
	//The hash is always exactly 42 characters - 2 for the two hash symbols and 40 for the SHA1 string
	var _hashless_string = string_copy(_save_string, 1, string_length(_save_string)-42);

	//Make a hash from the new hashless string
	//NB. We have to use the same hashing function as when we were saving
	var _new_hash = sha1_string_utf8(_hashless_string);

	//Check if the two hashes match
	if (_expected_hash == _new_hash)
	{
	    //Savefile is valid! Let's load the savedata
	    var load_map = json_decode(_hashless_string);
		//return load_map;
		objSettings_Tracker.settings = load_map;
	}
	else
	{
	    show_error("Savefile integrity check failed :(", false);
	}
	
	//Load in the save string
	var file = file_text_open_read(STATSFILE);
	var _save_string = file_text_read_string(file);
	file_text_close(file);

	//Find the hash tacked onto the end of the save string
	var _expected_hash = string_copy(_save_string, string_length(_save_string)-40, 40);

	//Trim off the hash
	//The hash is always exactly 42 characters - 2 for the two hash symbols and 40 for the SHA1 string
	var _hashless_string = string_copy(_save_string, 1, string_length(_save_string)-42);

	//Make a hash from the new hashless string
	//NB. We have to use the same hashing function as when we were saving
	var _new_hash = sha1_string_utf8(_hashless_string);

	//Check if the two hashes match
	if (_expected_hash == _new_hash)
	{
	    //Savefile is valid! Let's load the savedata
	    var load_map = json_decode(_hashless_string);
		//return load_map;
		objSettings_Tracker.stats = load_map;
	}
	else
	{
	    show_error("Savefile integrity check failed :(", false);
	}
	
	objSettings_Tracker.stats[? "session_kills"] = 0;
	objSettings_Tracker.stats[? "session_hours"] = 0;
}

function update_save(){
	if(!instance_exists(objLoading)) instance_create_layer(5, 280, "Loading", objLoading);
	save_settings();
	objLoading.stop = true;
}

function wait(stime,secs){
	var microsecs = secs * 1000000;
	if(get_timer() >= stime + microsecs) return true; else return false;
}

function grid_place_meeting(_object,_grid){
	var _top_right = _grid[# (_object.bbox_right-1) div CELL_WIDTH, _object.bbox_top div CELL_HEIGHT] == VOID;
	var _top_left = _grid[# _object.bbox_left div CELL_WIDTH, _object.bbox_top div CELL_HEIGHT] == VOID;
	var _bottom_right = _grid[# (_object.bbox_right-1) div CELL_WIDTH, (_object.bbox_bottom-1) div CELL_HEIGHT] == VOID;
	var _bottom_left = _grid[# _object.bbox_left div CELL_WIDTH, (_object.bbox_bottom-1) div CELL_HEIGHT] == VOID;
	
	return _top_right || _top_left || _bottom_right || _bottom_left;
}

function screen_shake(magnitude,frames,leftrumble,rightrunble,rumbleframes){
	with(objCamera){
		if(magnitude > shake_remain){
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
		if(instance_exists(objTodd) && objTodd.controller == 1){
			if(leftrumble > vibrate_left || rightrunble > vibrate_right){
				vibrate_left = leftrumble;
				vibrate_right = rightrunble;
				vibrate_remain = rumbleframes;
			}
		}else{
			if(leftrumble > vibrate_left || rightrunble > vibrate_right){
				vibrate_left = leftrumble;
				vibrate_right = rightrunble;
				vibrate_remain = rumbleframes;
			}
		}
	}
}

function menu_shake(magnitude,frames){
	with(objMenu_Camera){
		if(magnitude > shake_remain){
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
	}
}

function get_empty_floor(obj){
	var list_size = (ds_list_size(obj.floor_list) - 1) div 2;
	var list_index = (irandom_range(0, list_size)) * 2;
	var list_value = ds_list_find_value(obj.floor_list, list_index);
	while(ds_list_find_index(obj.floor_used_list, list_value) != -1){
		list_index = (irandom_range(0, list_size)) * 2;
		list_value = ds_list_find_value(obj.floor_list, list_index);
	}
	ds_list_add(obj.floor_used_list, list_value);
	//var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2;
	//var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2;
	//return [start_x, start_y];
	
	return [list_value[0], list_value[1]];
}

function knock_out_walls(grid, _x, _y){
	var edge_id = layer_tilemap_get_id("WallTilesEdge");
	var front_id = layer_tilemap_get_id("WallTilesFront");
	var back_id = layer_tilemap_get_id("WallTilesBack");
	var clear_id = layer_get_id("FloorClear");
	
	if(grid[# _x,_y] != FLOOR) clear_wall(grid, _x, _y, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x-1, _y-1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x, _y-1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x+1, _y-1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x-1, _y, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x+1, _y, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x-1, _y+1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x, _y+1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x+1, _y+1, front_id, back_id, edge_id, clear_id);
}

function clear_wall(grid, _x, _y, front_id, back_id, edge_id, clear_id){
	if(grid[# _x,_y] == VOID){
		grid[# _x,_y] = FLOOR;
		tilemap_set(back_id,0,_x,_y);
		tilemap_set(front_id,0,_x,_y);
		tilemap_set(edge_id,0,_x-1,_y);
		tilemap_set(edge_id,0,_x+1,_y);
		var clear_x = _x * CELL_WIDTH;
		var clear_y = _y * CELL_HEIGHT;
		instance_create_layer(clear_x-1, clear_y-1, clear_id, objFloorClearOne);
	} 
}

function get_weighted_value(options){
	var weight_total = 0;
	var weight_array = array_create(array_length(options));
	for(var _i = 0; _i < array_length(options); _i++) {
	   weight_total += options[_i];
	   weight_array[_i] = weight_total;
	}
	var rnd = random(weight_total);
	for(var _i = 0; _i < array_length(options); _i++) {
	  if(rnd < weight_array[_i]) return _i;
	  //rnd -= options[_i];
	}
}

function stage_end(){
	objSettings_Tracker.stats[? "lifetime_kills"] += objSettings_Tracker.kills;
	objSettings_Tracker.stats[? "session_kills"] += objSettings_Tracker.kills;
	var complete = objSettings_Tracker.level + (objSettings_Tracker.stage / 10);
	if(objSettings_Tracker.stats[? "furthest_complete"] < complete) objSettings_Tracker.stats[? "furthest_complete"] = complete;
	objSettings_Tracker.stats[? "lifetime_hours"] += get_timer() - objSettings_Tracker.time;
	objSettings_Tracker.stats[? "session_hours"] += get_timer() - objSettings_Tracker.time;
	objSettings_Tracker.time = get_timer();
	if(objSettings_Tracker.dead){
		objSettings_Tracker.level = 1;
		objSettings_Tracker.stage = 1;
		objSettings_Tracker.kills = 0;
	}
	objSettings_Tracker.dead = false;
}

function get_enemie_counts(){
	//hornet_range
	//demon_range
	//fetus_range
	//water_range
	switch(objSettings_Tracker.stage){
		case 1:
			objSettings_Tracker.enemie_ranges = [irandom_range(8,10), irandom_range(2,4), irandom_range(2,4), irandom_range(2,5)];
			break;
		case 3:
			objSettings_Tracker.enemie_ranges = [irandom_range(12,14), irandom_range(2,6), irandom_range(4,8), irandom_range(3,6)];
			break;
		case 4:
			objSettings_Tracker.enemie_ranges = [irandom_range(12,18), irandom_range(4,8), irandom_range(4,11), irandom_range(3,6)];
			break;
	}
	objSettings_Tracker.ememie_multiplier = objSettings_Tracker.level * 0.75;
}

function dead_pickup(obj, hlt, amo, plt){
	var spill = irandom_range(obj.pelletL, obj.pelletH);
	for(var i = 0; i < spill; i++){
		instance_create_layer(obj.x, obj.y, "Pickups", plt);
	}
	if(objTodd.hp < objTodd.hp_max && hlt){
		var hlt_drop = irandom_range(1, 10);
		if(hlt_drop == 1) instance_create_layer(obj.x, obj.y, "Pickups", objHealth);
	}
	if(amo){
		if(check_special(AMMOHITS)) var c = 5; else var c = 10;
		var hlt_drop = irandom_range(1, c);
		if(hlt_drop == 1) instance_create_layer(obj.x, obj.y, "Pickups", objAmmo);
	}
}

function set_weapon(gun){
	objTodd.currentGun = gun;
	objTodd.gunsprite =  objTodd.guns[objTodd.currentGun, GUNSPRITE];
	objTodd.reloadtime =  objTodd.guns[objTodd.currentGun, RELOADTIME];
	objTodd.recoilstart =  objTodd.guns[objTodd.currentGun, RECOILSTART];
	objTodd.shotamount =  objTodd.guns[objTodd.currentGun, SHOTAMOUNT];
	objTodd.shotspread =  objTodd.guns[objTodd.currentGun, SHOTSPREAD];
	objTodd.shotspeed =  objTodd.guns[objTodd.currentGun, SHOTSPEED];
	objTodd.shotbuffer =  objTodd.guns[objTodd.currentGun, SHOTBUFFER];
	objTodd.attackpoints = objTodd.guns[objTodd.currentGun, ATTACKPOINTS];
	objTodd.xorgin = objTodd.guns[objTodd.currentGun, XORGIN];
	objTodd.yorgin = objTodd.guns[objTodd.currentGun, YORGIN];
	objTodd.bulletobj = objTodd.guns[objTodd.currentGun, BULLETOBJ];
	objTodd.bulletspt = objTodd.guns[objTodd.currentGun, BULLETSPT];
	objTodd.bulletsnd = objTodd.guns[objTodd.currentGun, BULLETSND];
	objTodd.bulletshake = objTodd.guns[objTodd.currentGun, BULLETSHAKE];
	objTodd.bulletamount = objTodd.guns[objTodd.currentGun, BULLETAMOUNT];
	objTodd.bulletangle = objTodd.guns[objTodd.currentGun, BULLETANGLE];
	objTodd.bulletindex = objTodd.guns[objTodd.currentGun, BULLETINDEX];
	objTodd.reloadindex = objTodd.guns[objTodd.currentGun, RELOADINDEX];
	objTodd.beam = objTodd.guns[objTodd.currentGun, BEAM];
	objTodd.melee = objTodd.guns[objTodd.currentGun, MELEE];
	objTodd.casings = objTodd.guns[objTodd.currentGun, CASINGS];
	objTodd.casingfreq = objTodd.guns[objTodd.currentGun, CASINGFREQ];
	objTodd.weapon_xoffset = sprite_get_xoffset(objTodd.gunsprite);
}

function get_pickup(pickup, pickup_object){
	if(string_count("pellets", pickup) > 0){
			objSettings_Tracker.stats[? pickup]++;
	}if(pickup == "special"){
		var i = array_length(objTodd.specials_pickedup);
		objTodd.specials_pickedup[i] = pickup_object.sprite_index;
		objTodd.specials_pickedup_y[i] = 400;
		objTodd.specials_pickedup_text[i] = get_special_string(pickup_object.special);
	}
}

function check_array_value(array, value){
	var check = false;
	for(var i = 0; i < array_length(array); i++){
		if(array[i] == value) check = true;
	}
	return check;
}
