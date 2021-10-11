function select_item(){
	menu_committed = menu_cursor;
	menu_control = false;
}

var key_down = false;
var key_up = false;
var key_left = false;
var key_right = false;
var key_enter = false;
var gp_down = false;
var gp_up = false;
var gp_left = false;
var gp_right = false;
var gp_enter = false;
	
if(objSettings_Tracker.settings[? "controls"] == 0){
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	key_enter = keyboard_check_pressed(vk_enter);
}else{
	gp_down = gamepad_button_check_pressed(0,gp_padd);
	gp_up = gamepad_button_check_pressed(0,gp_padu);
	gp_left = gamepad_button_check_pressed(0,gp_padl);
	gp_right = gamepad_button_check_pressed(0,gp_padr);
	gp_enter = gamepad_button_check_pressed(0,gp_face1);
}

if(menu_control){
	if(key_down || gp_down){
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(key_up || gp_up){
		menu_cursor--;
		if(menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if(key_enter || gp_enter) select_item();
	if(objSettings_Tracker.settings[? "controls"] == 0){
		if(position_meeting(mouse_x, mouse_y, objAudio_Mute)){
			menu_cursor = 0;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objAudio_Volume)){
			menu_cursor = 1;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
	}
}else{
	switch(menu_cursor){
		case 0: 
			objSettings_Tracker.settings[? "mute"] = !objSettings_Tracker.settings[? "mute"];
			update_save();
			if(objSettings_Tracker.settings[? "mute"]) audio_master_gain(0); else audio_master_gain(objSettings_Tracker.settings[? "audio_level"]/10);
			menu_control = true;
			objMenu_Camera.menu_shake();
			break;
		case 1:
			menu_control = true;
			break;
	}
}

if(menu_cursor == 1){
	var level = objSettings_Tracker.settings[? "audio_level"];
	if(key_left || gp_left){
		level--;
	}
	if(key_right || gp_right){
		level++;
	}
	objSettings_Tracker.settings[? "audio_level"] = clamp(level, 0, 10);
	update_save();
	objAudio_Volume_Thumb.x = 261 + (15 * objSettings_Tracker.settings[? "audio_level"]);
	if(objSettings_Tracker.settings[? "mute"]) audio_master_gain(0); else audio_master_gain((objSettings_Tracker.settings[? "audio_level"]/10));
}

switch(menu_cursor){
	case 0:{
		objMenu_Select.y = 69;
		objAudio_Mute.sprite_index = sptAudio_MuteHighlight;
		objAudio_Volume.sprite_index = sptAudio_Volume;
		if(objSettings_Tracker.settings[? "mute"]) objAudio_Mute_Options.sprite_index = sptAudio_Mute_OnHighlight;
		else objAudio_Mute_Options.sprite_index = sptAudio_Mute_OffHighlight;
		break;
	}
	case 1:{
		objMenu_Select.y = 141;
		objAudio_Mute.sprite_index = sptAudio_Mute;
		objAudio_Volume.sprite_index = sptAudio_VolumeHighlight;
		if(objSettings_Tracker.settings[? "mute"]) objAudio_Mute_Options.sprite_index = sptAudio_Mute_On;
		else objAudio_Mute_Options.sprite_index = sptAudio_Mute_Off;
		break;
	}
}

switch(objSettings_Tracker.settings[? "audio_level"]){
	case 0: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value0; break;
	case 1: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value1; break;
	case 2: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value2; break;
	case 3: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value3; break;
	case 4: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value4; break;
	case 5: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value5; break;
	case 6: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value6; break;
	case 7: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value7; break;
	case 8: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value8; break;
	case 9: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value9; break;
	case 10: objAudio_Volume_Options.sprite_index = sptAudio_Volume_Value10; break;
}

if((objSettings_Tracker.settings[? "controls"] == 0 && ((position_meeting(mouse_x, mouse_y, objMenu_Back) && mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_escape))) || (objSettings_Tracker.settings[? "controls"] == 1 && gamepad_button_check_pressed(0,gp_face2))){
	room_goto(rmSettings);
}

if(objSettings_Tracker.settings[? "controls"] == 0) objMenu_Back.sprite_index = sptMenu_BackKM;
else objMenu_Back.sprite_index = sptMenu_BackGP;
