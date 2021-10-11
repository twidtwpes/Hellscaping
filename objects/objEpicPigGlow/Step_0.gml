if(fade_out){
	image_alpha = max(0, image_alpha - fade_ammount);
	if(image_alpha == 0) fade_out = false;
	start_time = get_timer();
}else{
		if(wait(start_time, 1)){
			image_alpha = min(1, image_alpha + fade_ammount);
			if(image_alpha == 1){
				instance_create_layer(0,64,"Logos",objGameMakerLogo);
				with(objEpicPigLogo) instance_destroy();
				instance_destroy();
			}
		}
}