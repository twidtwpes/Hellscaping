if(collision_circle(x, y, radius, objTodd, false, true)){
	direction = point_direction(x, y, objTodd.x, objTodd.y);
	speed = abs(radius - point_distance(x, y, objTodd.x, objTodd.y)) / collect_speed;
}