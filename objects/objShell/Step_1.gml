if(image_speed == 0 && (grid_place_meeting(self, objLevelOne.grid_) || place_meeting(x, y, objFloorBorder))){
	instance_destroy();
}

if(!first){
	image_speed = 0;
	image_index = 1;

	speed = sp;
}

if(ap == 3) var e = 0.2 else var e = 0.118;
if(wait(stime,e)) instance_destroy();