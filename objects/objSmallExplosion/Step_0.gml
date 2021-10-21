if(wait(stime, smoke_interval)){
	with(instance_create_layer(x, y, "Bullets", objSmoke)){
		speed = 1;
		var veer = random_range(-60, 60);
		direction = 90 + veer;
	}
	stime = get_timer();
}