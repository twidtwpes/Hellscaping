var dir = point_direction(x, y, objTodd.x, objTodd.y);
if(grid_place_meeting(self, objLevelOne.grid_)){
	direction += 15;
}else{
	direction = dir;
}
image_angle = dir;
if(dir > 90 && dir < 270) image_yscale = -1; else image_yscale = 1;