
if(speed != 0){
	if(grid_place_meeting(self, objLevelOne.grid_)){
		speed = -speed;
		direction -= 90;
	}
	var spd = (abs(speed) - 0.4) * sign(speed);
	speed = spd;
	if(floor(speed) == 0) speed = 0;
	if(speed == 0){
		x = floor(x);
		y = floor(y);
	}
}

