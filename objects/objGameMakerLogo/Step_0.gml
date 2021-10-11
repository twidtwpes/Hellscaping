if(fade_in){
	image_alpha = min(1, image_alpha + fade_ammount);
	if(image_alpha == 1) fade_in = false;
	start_time = get_timer();
}else{
		if(wait(start_time, 1)){
			image_alpha = max(0, image_alpha - fade_ammount);
			if(image_alpha == 0){
				room_goto_next();
			}
		}
}