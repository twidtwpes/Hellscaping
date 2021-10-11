// Inherit the parent event
event_inherited();

if(wait(start_time, 0.1)){
	if(keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_start)){
		if(selected) room_goto(rmTitle);
	}
}