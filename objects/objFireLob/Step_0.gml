if(wait(stime, ntime)){
	switch(phase){
		case 0:
			stime = get_timer();
			ntime = 0.3;
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

if(done){
	instance_create_layer(x, y, "Bullets", objMediumExplosion);
	instance_destroy();
}