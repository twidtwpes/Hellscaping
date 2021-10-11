function select_item(){
	menu_committed = menu_cursor;
	menu_control = false;
}

var key_down = false;
var key_up = false;
var key_enter = false;
var gp_down = false;
var gp_up = false;
var gp_enter = false;
	
if(objSettings_Tracker.settings[? "controls"] == 0){
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_enter = keyboard_check_pressed(vk_enter);
}else{
	gp_down = gamepad_button_check_pressed(0,gp_padd);
	gp_up = gamepad_button_check_pressed(0,gp_padu);
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
		if(position_meeting(mouse_x, mouse_y, objSettings_FullScreen)){
			menu_cursor = 0;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objSettings_Audio)){
			menu_cursor = 1;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objSettings_Controls)){
			menu_cursor = 2;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objSettings_Credits)){
			menu_cursor = 3;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
	}
}else{
	switch(menu_cursor){
		case 0: 
			objSettings_Tracker.settings[? "fullscreen"] = !objSettings_Tracker.settings[? "fullscreen"];
			update_save();
			window_set_fullscreen(objSettings_Tracker.settings[? "fullscreen"]);
			menu_control = true;
			objMenu_Camera.menu_shake();
			break;
		case 1: room_goto(rmAudio); break;
		case 2: room_goto(rmControls); break;
		case 3: room_goto(rmCredits); break;
	}
}

if((objSettings_Tracker.settings[? "controls"] == 0 && ((position_meeting(mouse_x, mouse_y, objMenu_Back) && mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_escape))) || (objSettings_Tracker.settings[? "controls"] == 1 && gamepad_button_check_pressed(0,gp_face2))){
	if(objSettings_Tracker.pause){
		room_goto(objSettings_Tracker.level_load);
	}else{
		objSettings_Tracker.title_menu = 1;
		room_goto(rmTitle2);
	}
}

switch(menu_cursor){
	case 0:
		objSettings_FullScreen.sprite_index = sptSettings_FullScreenHighlight;
		objSettings_Audio.sprite_index = sptSettings_Audio
		objSettings_Controls.sprite_index = sptSettings_Controls;
		objSettings_Credits.sprite_index = sptSettings_Credits;
		objMenu_Select.y = 68;
		break;
	case 1:
		objSettings_FullScreen.sprite_index = sptSettings_FullScreen;
		objSettings_Audio.sprite_index = sptSettings_AudioHighlight;
		objSettings_Controls.sprite_index = sptSettings_Controls;
		objSettings_Credits.sprite_index = sptSettings_Credits;
		objMenu_Select.y = 126;
		break;
	case 2:
		objSettings_FullScreen.sprite_index = sptSettings_FullScreen;
		objSettings_Audio.sprite_index = sptSettings_Audio;
		objSettings_Controls.sprite_index = sptSettings_ControlsHighlight;
		objSettings_Credits.sprite_index = sptSettings_Credits;
		objMenu_Select.y = 194;
		break;
	case 3:
		objSettings_FullScreen.sprite_index = sptSettings_FullScreen;
		objSettings_Audio.sprite_index = sptSettings_Audio;
		objSettings_Controls.sprite_index = sptSettings_Controls;
		objSettings_Credits.sprite_index = sptSettings_CreditsHighlight;
		objMenu_Select.y = 262;
		break;
}

if(objSettings_Tracker.settings[? "fullscreen"]){
	if(menu_cursor == 0) objSettings_Fullscreen_Option.sprite_index = sptSettings_FullScreen_OnHighlight;
	else objSettings_Fullscreen_Option.sprite_index = sptSettings_FullScreen_On;
}else{
	if(menu_cursor == 0) objSettings_Fullscreen_Option.sprite_index = sptSettings_FullScreen_OffHighlight;
	else objSettings_Fullscreen_Option.sprite_index = sptSettings_FullScreen_Off;
}

if(objSettings_Tracker.settings[? "controls"] == 0) objMenu_Back.sprite_index = sptMenu_BackKM;
else objMenu_Back.sprite_index = sptMenu_BackGP;
