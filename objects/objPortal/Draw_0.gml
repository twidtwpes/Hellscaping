if(entered){
	draw_sprite(sptPortal_Done, 0, x, y);
	draw_sprite_ext(sptPortal_Center, 0, x, y, center_s, center_s, 0, c_white, 1);
	if(center_s > 0){
		center_s -= center_amount;
	}else{
		objSettings_Tracker.stage ++;
		if(objSettings_Tracker.stage > 3){
			objSettings_Tracker.stage = 1;
			objSettings_Tracker.level ++;
		}
		room_goto(rmStageIntro);
	}
}else{
	if(fadeout){
		alpha -= fade_amount;
	}else{
		alpha += fade_amount;
	}

	if(alpha > 1){
		alpha = 1;
		fadeout = true;
	}
	if(alpha < 0){
		alpha = 0;
		fadeout = false;
	}

	draw_self();
	draw_sprite_ext(sptPortal_Glow, 0, x, y, 1, 1, 0, c_white, alpha);
}