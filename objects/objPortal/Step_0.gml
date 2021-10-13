if(entered){
	if(wait(stime, light)){
		var xx = irandom_range(-15 * center_s, 15 * center_s);
		instance_create_layer(x + xx, y - 100, "Portal_Light", objPortal_Light);
		
		stime = get_timer();
		light = random_range(0.005, 0.03);
	}
}else{
	
	if(collision_circle(x, y, radius, objTodd, false, true)){
		if(point_distance(objTodd.x, objTodd.y, x, y) > 10){
			var dir = point_direction(objTodd.x, objTodd.y, x, y);
			var spd = abs(radius - point_distance(objTodd.x, objTodd.y, x, y)) / tracker_speed;
			objTodd.x_portal = lengthdir_x(spd, dir);
			objTodd.y_portal = lengthdir_y(spd, dir);
		}else{
			objTodd.x_portal = 0;
			objTodd.y_portal = 0;
		}
	}
	if(wait(stime, light)){
		var xx = irandom_range(-15, 15);
		instance_create_layer(x + xx, y - 1000, "Portal_Light", objPortal_Light);
	
		stime = get_timer();
		light = random_range(0.05, 0.2);
	}
}