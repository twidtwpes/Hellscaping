if(sprite_index != sptUltra_BoxDestroyed){
	if(fade_in){
		alpha += fade_amount;
		if(alpha >= 1) fade_in = false;
	}else{
		alpha -= fade_amount;
		if(alpha <= 0) fade_in = true;	
	}

	image_alpha = alpha;
}