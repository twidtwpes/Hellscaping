if(instance_exists(rocket)){
	x = rocket.x;
	y = rocket.y;
	image_angle = rocket.image_angle;
	direction = rocket.direction;

	var pdis = point_distance(x,y,rocket.x,rocket.y)-5;
	var pdir = point_direction(x,y,rocket.x,rocket.y);
	var xx = lengthdir_x(pdis, pdir);
	//var yy = lengthdir_y(pdis, pdir);
	//var ww = sprite_get_yoffset(sptRocketFlame);
	if(rocket.image_index == 1)	sprite_set_offset(sptRocketFlame, xx, 0);
	if(rocket.image_index == 2)	sprite_set_offset(sptRocketFlame, xx, 5);
}else{
	instance_destroy();
}