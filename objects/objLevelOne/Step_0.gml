if(!pause && objTrackEnemies.enemy_count == 0){
	room_goto(rmEndLevel);
}

if(keyboard_check_pressed(vk_f1) || gamepad_button_check_pressed(0, gp_select)){
	game_end();
}

var pause_check = false;
if(objSettings_Tracker.settings[? "controls"] == 0){
	pause_check = keyboard_check_pressed(vk_escape)
}else{
	pause_check = gamepad_button_check_pressed(0, gp_start)
}

if(pause_check){
	if(pause){
		instance_activate_all();
		objSettings_Tracker.pause = false;
		pause = false;
		confirm = false;
		objTodd.hascontrol = true;
	}else{
		screen_shake(0,0,0,0,0);
		screen_save(PAUSEFILE);
		spt_screenshot = sprite_add(PAUSEFILE, 0, 0, 0, 0, 0);
		if(objSettings_Tracker.settings[? "fullscreen"]){
			var h = camera_get_view_height(0) / display_get_height();
			var w = camera_get_view_width(0) / display_get_width();
			screenshot_scale = max(h, w);
		}else{
			screenshot_scale = 1;
		}
		objSettings_Tracker.pause = true;
		pause = true;
		objTodd.hascontrol = false;
		menu_fg_current = menu_fg_start;
		pause_select = 0;
		instance_deactivate_all(true);
		instance_activate_object(objSettings_Tracker)
	}
}

if(pause){
	var key_up = false;
	var key_down = false;
	var key_left = false;
	var key_right = false;
	var key_enter = false;
	
	if(objSettings_Tracker.settings[? "controls"] == 0){
		key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
		key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
		key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
		key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
		key_enter = keyboard_check_pressed(vk_enter);
	}else{
		key_up = gamepad_button_check_pressed(0,gp_padu);
		key_down = gamepad_button_check_pressed(0,gp_padd);
		key_left = gamepad_button_check_pressed(0,gp_padl);
		key_right = gamepad_button_check_pressed(0,gp_padr);
		key_enter = gamepad_button_check_pressed(0,gp_face1);
	}
	
	if(confirm){
		if(key_left) pause_select = 0;
		if(key_right) pause_select = 1;
		
		if(objSettings_Tracker.settings[? "controls"] == 0){
			if(device_mouse_x_to_gui(0) > no_x && device_mouse_y_to_gui(0) > no_y && device_mouse_x_to_gui(0) < no_x + no_w && device_mouse_y_to_gui(0) < no_y + no_h){
				pause_select = 0;
				if(mouse_check_button_pressed(mb_left)) key_enter = true;
			}
			if(device_mouse_x_to_gui(0) > yes_x && device_mouse_y_to_gui(0) > yes_y && device_mouse_x_to_gui(0) < yes_x + yes_w && device_mouse_y_to_gui(0) < yes_y + yes_h){
				pause_select = 1;
				if(mouse_check_button_pressed(mb_left)) key_enter = true;
			}
		}
		
		if(key_enter){
			switch(pause_select){
				case 0:
					confirm = false;
					if(confirm_option == 0) pause_select = 1;
					if(confirm_option == 1) pause_select = 3;
					break;
				case 1:
					room_persistent = false;
					//instance_activate_all();
					objSettings_Tracker.pause = false;
					if(confirm_option == 0) room_goto(rmStageIntro);
					if(confirm_option == 1) room_goto(rmTitle2);
					break;
			}
		}
	}else{
		if(key_up && pause_select == 1) pause_select = 0;
		if(key_up && pause_select == 3) pause_select = 2;
		if(key_down && pause_select == 0) pause_select = 1;
		if(key_down && pause_select == 2) pause_select = 3;
		if(key_left && pause_select == 2) pause_select = 0;
		if(key_left && pause_select == 3) pause_select = 1;
		if(key_right && pause_select == 0) pause_select = 2;
		if(key_right && pause_select == 1) pause_select = 3;
		
		if(objSettings_Tracker.settings[? "controls"] == 0){
			if(device_mouse_x_to_gui(0) > continue_x && device_mouse_y_to_gui(0) > continue_y && device_mouse_x_to_gui(0) < continue_x + continue_w && device_mouse_y_to_gui(0) < continue_y + continue_h){
				pause_select = 0;
				if(mouse_check_button_pressed(mb_left)) key_enter = true;
			}
			if(device_mouse_x_to_gui(0) > retry_x && device_mouse_y_to_gui(0) > retry_y && device_mouse_x_to_gui(0) < retry_x + retry_w && device_mouse_y_to_gui(0) < retry_y + retry_h){
				pause_select = 1;
				if(mouse_check_button_pressed(mb_left)) key_enter = true;
			}
			if(device_mouse_x_to_gui(0) > settings_x && device_mouse_y_to_gui(0) > settings_y && device_mouse_x_to_gui(0) < settings_x + settings_w && device_mouse_y_to_gui(0) < settings_y + settings_h){
				pause_select = 2;
				if(mouse_check_button_pressed(mb_left)) key_enter = true;
			}
			if(device_mouse_x_to_gui(0) > quit_x && device_mouse_y_to_gui(0) > quit_y && device_mouse_x_to_gui(0) < quit_x + quit_w && device_mouse_y_to_gui(0) < quit_y + quit_h){
				pause_select = 3;
				if(mouse_check_button_pressed(mb_left)) key_enter = true;
			}
		}
	
		if(gamepad_button_check_pressed(0,gp_face2)){
			key_enter = true; 
			pause_select = 0;
		}
		
		if(key_enter){
			switch(pause_select){
				case 0: 
					instance_activate_all();
					objSettings_Tracker.pause = false;
					pause = false;
					objTodd.hascontrol = true;
					break;
				case 1:
					confirm = true;
					confirm_option = 0;
					pause_select = 0;
					break;
				case 2:
					room_persistent = true;
					room_goto(rmSettings);
					break;
				case 3:
					confirm = true;
					confirm_option = 1;
					pause_select = 0;
					break;
			}
		}
	}
}

