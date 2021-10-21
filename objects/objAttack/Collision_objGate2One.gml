with(other){
	if(other.image_speed == 0 && !destroyed){
		flash = 3;
		with(other){
			done = true;
		}
		destroyed = true;
		instance_create_layer(x, y, "ExtraObjects", objGate2OneDestroyed);
		screen_shake(5,8,0.4,0.4,8);
		repeat(20){
			var xx = irandom_range(x-4, x+4);
			var yy = irandom_range(y-4, y+4);
			var pt = point_direction(x,y,xx,yy);
			with(instance_create_layer(xx, yy, "Bullets", objGate1OneBullet)){
				direction = pt;
				speed = 0.8;
			}
		}
		instance_destroy();
	}
}