if(wait(stimer, 5)) instance_destroy();
if(speed > 0){
	speed -= 0.1;
}else{
	x = floor(x);
	y = floor(y);
}