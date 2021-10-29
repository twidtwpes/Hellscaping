if(!menu_committed){
	var key_right = false;
	var key_left = false;
	var key_enter = false;
	
	if(objSettings_Tracker.settings[? "controls"] == 0){
		key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
		key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
		key_enter = keyboard_check_pressed(vk_enter);
	}else{
		key_right = gamepad_button_check_pressed(0,gp_padr);
		key_left = gamepad_button_check_pressed(0,gp_padl);
		key_enter = gamepad_button_check_pressed(0,gp_face1);
	}

	if(key_right) selected++;
	if(key_left) selected--;
	if(selected < 0) selected = specials_count - 1;
	if(selected > specials_count - 1) selected = 0;

	if(key_enter){
		menu_committed = true;
		flash = 10;
		with(objSettings_Tracker){
			specials_applied[array_length(specials_applied)] = get_special_index(other.specials[other.selected]);
		}
	}
}