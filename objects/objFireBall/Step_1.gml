if((grid_place_meeting(self, objLevelOne.grid_) || place_meeting(x, y, objFloorBorder))){
	instance_destroy();
}

if(flamestart == 1){
	image_index = 4;
	flamestart++;
}else if(flamestart > 0){
	speed = sp;	
	if(image_index == 6) image_index = 4;
}else{
	flamestart++;
}
