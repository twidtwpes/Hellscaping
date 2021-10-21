if(grid_place_meeting(self, objLevelOne.grid_) || place_meeting(x, y, objFloorBorder)){
	speed = 0;
	phase = 5;
}else{
	if(phase > 2) speed = 0; else speed = sp;
}

if(wait(stime, ntime)){
	switch(phase){
		case 0:
			stime = get_timer();
			ntime = 0.1;
			break;
	}
	phase++;
}

switch(phase){
	case 0:
		y-=ark;
		break;
	case 1:
		y+=ark;
		break;
}

if(wait(bstime, betime)){
	instance_destroy();
}