draw_set_font(fntDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

//var list_size = (ds_list_size(floor_list) - 1) div 2;
//var list_index = (irandom_range(0, list_size)) * 2;
//var list_value = ds_list_find_value(floor_list, list_index);
//draw_text(10,10,list_index);
//draw_text(10,20,list_value[0]);

function get_stage_number(num){
	switch(num){
		case 0: return sptStageIntro_0; break;
		case 1: return sptStageIntro_1; break;
		case 2: return sptStageIntro_2; break;
		case 3: return sptStageIntro_3; break;
		case 4: return sptStageIntro_4; break;
		case 5: return sptStageIntro_5; break;
		case 6: return sptStageIntro_6; break;
		case 7: return sptStageIntro_7; break;
		case 8: return sptStageIntro_8; break;
		case 9: return sptStageIntro_9; break;
	}
}


if(pause){
	draw_sprite_ext(spt_screenshot, 0, 0, 0, screenshot_scale, screenshot_scale, 0, c_white, 1);
	draw_sprite_ext(spt_screenshot, 0, 0, 0, screenshot_scale, screenshot_scale, 0, c_black, 0.5);
	
	if(confirm){
		switch(pause_select){
			case 0: draw_sprite(sptMenu_Select, 0, 50, 160); break;
			case 1: draw_sprite(sptMenu_Select, 0, 250, 160); break;
		}
		
		draw_sprite(sptMenu_AreYouSure, 0, 80, 70);
		draw_sprite(sptMenu_No, 0, no_x, no_y);
		draw_sprite(sptMenu_Yes, 0, yes_x, yes_y);
		
		switch(pause_select){
			case 0: draw_sprite(sptMenu_NoHighlight, 0, no_x, no_y); break;
			case 1: draw_sprite(sptMenu_YesHighlight, 0, yes_x, yes_y); break;
		}
		
	}else{
		switch(pause_select){
			case 0: draw_sprite(sptMenu_Select, 0, 30, 160); break;
			case 1: draw_sprite(sptMenu_Select, 0, 45, 230); break;
			case 2: draw_sprite(sptMenu_Select, 0, 264, 160); break;
			case 3: draw_sprite(sptMenu_Select, 0, 270, 230); break;
		}
	
		draw_sprite(sptPause_Pause, 0, 115, 70);
		draw_sprite(sptPause_Continue, 0, continue_x, continue_y);
		draw_sprite(sptPause_Retry, 0, retry_x, retry_y);
		draw_sprite(sptPause_Settings, 0, settings_x, settings_y);
		draw_sprite(sptPause_Quit, 0, quit_x, quit_y);
	
		switch(pause_select){
			case 0: draw_sprite(sptPause_ContinueHighlight, 0, continue_x, continue_y); break;
			case 1: draw_sprite(sptPause_RetryHighlight, 0, retry_x, retry_y); break;
			case 2: draw_sprite(sptPause_SettingsHighlight, 0, settings_x, settings_y); break;
			case 3: draw_sprite(sptPause_QuitHighlight, 0, quit_x, quit_y); break;
		}
	}
	
	if(menu_fg_current > menu_fg_end) menu_fg_current -= menu_fg_amount;
	draw_sprite_ext(sptPause_Foreground, 0, 240, 160, menu_fg_current, menu_fg_current, 0, c_white, 1);

}

if(dead){
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, camera_get_view_width(0), camera_get_view_height(0), false);
	draw_set_alpha(1);
	
	switch(dead_select){
		case 0: draw_sprite(sptMenu_Select, 0, 45, 230); break;
		case 1: draw_sprite(sptMenu_Select, 0, 270, 230); break;
	}
	
	draw_sprite(sptMenu_Dead, 0, 115, 70);
	draw_sprite(sptPause_Retry, 0, retry_x, retry_y);
	draw_sprite(sptPause_Quit, 0, quit_x, quit_y);

	switch(dead_select){
		case 0: draw_sprite(sptPause_RetryHighlight, 0, retry_x, retry_y); break;
		case 1: draw_sprite(sptPause_QuitHighlight, 0, quit_x, quit_y); break;
	}

	draw_sprite(sptStageIntro_Stage, 0, 162, 131);
	draw_sprite(get_stage_number(objSettings_Tracker.level), 0, 247, 132);
	draw_sprite(sptStageIntro_Dash, 0, 268, 139);
	draw_sprite(get_stage_number(objSettings_Tracker.stage), 0, 285, 132);
	
	draw_sprite(sptStageIntro_Kills, 0, 180, 180);
	
	var n = objSettings_Tracker.kills;
	var r = 0;
	var i = 0;
	var h = [];
	do{
		r = n % 10
		h[i] = r;
		i++;
		n = (n - r) / 10;
	}until(n == 0);

	for(var j = (array_length(h)-1); j >= 0; j--){
		var num = h[j];
		draw_sprite(get_stage_number(num), 0, 252 + (17 * (array_length(h) - j - 1)), 182);
	}

	if(menu_fg_current > menu_fg_end) menu_fg_current -= menu_fg_amount;
	draw_sprite_ext(sptPause_Foreground, 0, 240, 160, menu_fg_current, menu_fg_current, 0, c_white, 1);
}