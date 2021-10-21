event_inherited();

if(grid_place_meeting(self, objLevelOne.grid_) || place_meeting(x, y, objFloorBorder)){
	speed = 0;
}else{
	speed = sp;
}

if(wait(stime, ltime)) instance_destroy();

