draw_set_font(fntDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

//var list_size = (ds_list_size(floor_list) - 1) div 2;
//var list_index = (irandom_range(0, list_size)) * 2;
//var list_value = ds_list_find_value(floor_list, list_index);
//draw_text(10,10,list_index);
//draw_text(10,20,list_value[0]);


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

//draw_text(20,20,spt_screenshot.sprite_width);