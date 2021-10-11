if(keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0, gp_face4)){
	game_restart();
}
if(keyboard_check_pressed(vk_f1) || gamepad_button_check_pressed(0, gp_select)){
	game_end();
}
if(keyboard_check_pressed(vk_f2)){
	if(window_get_fullscreen()) window_set_fullscreen(false); else window_set_fullscreen(true);
}