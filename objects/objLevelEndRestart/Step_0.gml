// Inherit the parent event
event_inherited();

if(wait(start_time, 1)){
	gamepad_set_vibration(0,0,0);
	if(keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_start)){
		room_goto(rmLevelOne);
	}
}