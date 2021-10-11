if(current_percent > 0){
	current_percent -= slow_down;
	speed = lerp(0, start_speed, current_percent);
	image_angle += rotation;
}else{
	speed = 0;
}

if(wait(tcollect, scollect)){
	if(collision_circle(x, y, radius, objTodd, false, true)){
		direction = point_direction(x, y, objTodd.x, objTodd.y);
		speed = abs(radius - point_distance(x, y, objTodd.x, objTodd.y)) / collect_speed;
	}
}

//if(grid_place_meeting(self, objLevelOne.grid_)) speed = -speed;
	
x = round(x);
y = round(y);

if(wait(stime, live)){
	instance_destroy();
}