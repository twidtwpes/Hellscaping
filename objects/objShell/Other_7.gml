image_speed = 0;
image_index = 1;

speed = sp;

if(first){
	if(ap == 3) var r = 15 else var r = 40;
	for(var i = 0; i < 3; i++){
		var s = irandom_range(-r,r);
		with(instance_create_layer(x, y, "Bullets", objShell)){
			sp = other.sp;
			direction = other.direction + s;
			image_angle = direction;
			ap = other.ap;
			image_index = 1;
			first = false;
		}
	}
}