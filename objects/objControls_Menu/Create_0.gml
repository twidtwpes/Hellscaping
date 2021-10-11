menu_control = true;
menu_cursor = 0;
menu_items = 2;
menu_committed = false;

if(objSettings_Tracker.settings[? "controls"] == 0){
	objControls_Gamepad_Options.sprite_index = sptControls_Gamepad_OffHighlight;
}else{
	objControls_Gamepad_Options.sprite_index = sptControls_Gamepad_OnHighlight;
}
	
objControls_Aim.image_alpha = 0;
objControls_Aim_Options.image_alpha = 0;
