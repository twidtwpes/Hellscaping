if(head != sptTitle_ToddHead){
	if(!settle_in){
		if(x >= 52){
			speed = 0;
			sprite_index = sptTitle_ToddIdle;
			image_index = 0;
			image_speed = 0;
			objTitle_Menu2.escape_start = true;
		}
	}else{
		head = sptTitle_ToddHead;
		stime = get_timer();
		get_gun = true;
	}
}else{
	if(wait(stime,1.8)){
		image_speed = 1;
	}
}