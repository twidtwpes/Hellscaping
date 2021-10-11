var key_enter = false;
var gp_enter = false;
	
if(objSettings_Tracker.settings[? "controls"] == 0){
	key_enter = keyboard_check_pressed(vk_enter);
}else{
	gp_enter = gamepad_button_check_pressed(0,gp_face1);
}

if(key_enter || gp_enter){
	objMenu_Camera.menu_shake();
	if(objSettings_Tracker.settings[? "controls"] == 0){
		objSettings_Tracker.settings[? "controls"] = 1;
		objControls_Gamepad_Options.sprite_index = sptControls_Gamepad_OnHighlight;
	}else{
		objSettings_Tracker.settings[? "controls"] = 0;
		objControls_Gamepad_Options.sprite_index = sptControls_Gamepad_OffHighlight;
	}
	update_save();
	
	objMenu_Camera.menu_shake();
}

if(objSettings_Tracker.settings[? "controls"] == 0){
	if(position_meeting(mouse_x, mouse_y, objControls_Gamepad)){
		if(mouse_check_button_pressed(mb_left)){
			if(objSettings_Tracker.settings[? "controls"] == 0) objSettings_Tracker.settings[? "controls"] = 1;
			else objSettings_Tracker.settings[? "controls"] = 0;
		}
	}
}

if((objSettings_Tracker.settings[? "controls"] == 0 && ((position_meeting(mouse_x, mouse_y, objMenu_Back) && mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_escape))) || (objSettings_Tracker.settings[? "controls"] == 1 && gamepad_button_check_pressed(0,gp_face2))){
	room_goto(rmSettings);
}

if(objSettings_Tracker.settings[? "controls"] == 0){
	objControls_Options.sprite_index = sptControls_OptionsKM;
	objMenu_Back.sprite_index = sptMenu_BackKM;
}else{
	objControls_Options.sprite_index = sptControls_OptionsGP;
	objMenu_Back.sprite_index = sptMenu_BackGP;
}