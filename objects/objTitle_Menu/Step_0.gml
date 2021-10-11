function select_item(){
	menu_committed = menu_cursor;
	menu_control = false;
}

var key_right = false;
var key_left = false;
var key_enter = false;
var gp_right = false;
var gp_left = false;
var gp_enter = false;
	
if(objSettings_Tracker.settings[? "controls"] == 0){
	key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	key_enter = keyboard_check_pressed(vk_enter);
}else{
	gp_right = gamepad_button_check_pressed(0,gp_padr);
	gp_left = gamepad_button_check_pressed(0,gp_padl);
	gp_enter = gamepad_button_check_pressed(0,gp_face1);
}

if(menu_control){
	if(key_right || gp_right){
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(key_left || gp_left){
		menu_cursor--;
		if(menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if(key_enter || gp_enter){
		select_item();
		if(gp_enter) screen_shake(2,7,0.2,0.2,10);
	}
	if(objSettings_Tracker.settings[? "controls"] == 0){
		if(position_meeting(mouse_x, mouse_y, objTitle_Start)){
			menu_cursor = 0;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objTitle_Settings)){
			menu_cursor = 1;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objTitle_Quit)){
			menu_cursor = 2;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
	}
}else{
	switch(menu_cursor){
		case 0: room_goto(rmLockers); break;
		case 1: room_goto(rmSettings); break;
		case 2: game_end(); break;
	}
}

switch(menu_cursor){
	case 0:{
		objTitle_StartHighlight.image_alpha = 1;
		objTitle_SettingsHighlight.image_alpha = 0;
		objTitle_QuitHighlight.image_alpha = 0;
		objTitle_Select.x = 5;
		break;
	}
	case 1:{
		objTitle_StartHighlight.image_alpha = 0;
		objTitle_SettingsHighlight.image_alpha = 1;
		objTitle_QuitHighlight.image_alpha = 0;
		objTitle_Select.x = 165;
		break;
	}
	case 2:{
		objTitle_StartHighlight.image_alpha = 0;
		objTitle_SettingsHighlight.image_alpha = 0;
		objTitle_QuitHighlight.image_alpha = 1;
		objTitle_Select.x = 328;
		break;
	}
}

if(objTitle_Escape.y < 122 && escape_start){
	objTitle_Escape.y += (escape_target - objTitle_Escape.y) / escape_speed;
}
if(objTitle_Escape.y > 110){
	objTitle_Todd.settle_in = true;
}