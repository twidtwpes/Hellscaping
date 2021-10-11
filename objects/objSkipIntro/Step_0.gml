if(objSettings_Tracker.settings[? "controls"] == 0){
	if(keyboard_check_pressed(vk_enter)) room_goto_next();
}else{
	if(gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_start)) room_goto_next();
}