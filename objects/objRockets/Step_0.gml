if(done){
	var pdir = direction;
	var pdis = 50;
	var xx = lengthdir_x(pdis, pdir);
	var yy = lengthdir_y(pdis, pdir);
	if(image_index = 0) instance_create_layer(x + xx, y + yy, "Bullets", objSmallExplosion);
	if(image_index = 1) instance_create_layer(x + xx, y + yy, "Bullets", objSmallExplosion);
	if(image_index = 2) instance_create_layer(x + xx, y + yy, "Bullets", objMediumExplosion);
}

event_inherited();

if(grid_place_meeting(self, objLevelOne.grid_) || place_meeting(x, y, objFloorBorder)){
	speed = 0;
}else{
	speed = sp;
}

if(wait(stime, smoke_interval)){
	with(instance_create_layer(x, y, "Bullets", objSmoke)){
		speed = 1;
		var veer = random_range(-5, 5);
		direction = 135 + veer;
	}
	stime = get_timer();
}