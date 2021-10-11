if(!open){
	if(wait(stime, etime)){
		image_index = 1;
		open = true;
		instance_create_layer(x, y, "EnemiesGrounded", objFetus);
	}
}