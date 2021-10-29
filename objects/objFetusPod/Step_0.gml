if(!open){
	if(wait(stime, etime)){
		image_index = 1;
		open = true;
		with(instance_create_layer(x, y, "EnemiesGrounded", objFetus)){
			var h = hp;
			if(check_special(BONEBREAKER)) hp = floor(h / 2);
		}
	}
}