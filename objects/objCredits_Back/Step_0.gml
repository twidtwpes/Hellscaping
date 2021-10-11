if((objSettings_Tracker.settings[? "controls"] == 0 && ((position_meeting(mouse_x, mouse_y, objMenu_Back) && mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_escape))) || (objSettings_Tracker.settings[? "controls"] == 1 && gamepad_button_check_pressed(0,gp_face2))){
	room_goto(rmSettings);
}


if(objSettings_Tracker.settings[? "controls"] == 0) objMenu_Back.sprite_index = sptMenu_BackKM;
else objMenu_Back.sprite_index = sptMenu_BackGP;
