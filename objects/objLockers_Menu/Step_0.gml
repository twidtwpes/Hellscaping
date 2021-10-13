//for(var i = 0; i < array_length(menu_objects); i++){
//	menu_objects[i].y+=.1;
//}

function select_item(){
	menu_committed = menu_cursor;
	menu_control = false;
}

var key_down = false;
var key_up = false;
var key_enter = false;
var gp_down = false;
var gp_up = false;
var gp_enter = false;
var key_back = false;
var gp_back = false;
	
if(objSettings_Tracker.settings[? "controls"] == 0){
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_enter = keyboard_check_pressed(vk_enter);
	key_back = keyboard_check_pressed(vk_escape);
}else{
	gp_down = gamepad_button_check_pressed(0,gp_padd);
	gp_up = gamepad_button_check_pressed(0,gp_padu);
	gp_enter = gamepad_button_check_pressed(0,gp_face1);
	gp_back = gamepad_button_check_pressed(0,gp_face2);
}

if(menu_control){
	if(key_back || gp_back) room_goto(rmTitle2);
	if(key_down || gp_down) menu_cursor++;
	if(key_up || gp_up) menu_cursor--;
	menu_cursor = clamp(menu_cursor, 0, menu_items-1);
	if(key_down || gp_down || key_up || gp_up){
		for(var i = 0; i < array_length(menu_objects); i++){
			menu_targets[i][1] = menu_positions [i][1] - (menu_move * menu_cursor);
		}
	}
	if(key_enter || gp_enter) select_item();
}else{
	switch(menu_cursor){
		case 0: room_goto(rmStageIntro); break;
		case 1: menu_control = true; break;
		case 2: menu_control = true; break;
		case 3: menu_control = true; break;
	}
}

for(var i = 0; i < array_length(menu_objects); i++){
	if(menu_objects[i].y > menu_targets[i][1]){
		menu_objects[i].y += (menu_targets[i][1] - menu_objects[i].y) / menu_speed;
	}
	if(menu_objects[i].y < menu_targets[i][1]){
		menu_objects[i].y -= (menu_objects[i].y - menu_targets[i][1]) / menu_speed;
	}
}