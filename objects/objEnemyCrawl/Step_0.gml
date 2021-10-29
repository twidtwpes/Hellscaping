var dir = point_direction(x, y, objTodd.x, objTodd.y);
if(grid_place_meeting(self, objLevelOne.grid_) || place_meeting(x, y, objFloorBorder)){
	direction += 15;
}else{
	direction = dir;
}
image_angle = dir;
if(dir > 90 && dir < 270) image_yscale = -1; else image_yscale = 1;


if(hp == 0){
	with(instance_create_layer(x, y, "Dead", objFetusDead)){
		speed = 10;
	}

	dead_pickup(self, false, false, objSpecial_Pellet);
	
	screen_shake(5,8,0.4,0.4,8);
	instance_destroy();
}