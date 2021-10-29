if(check_special(DEADSHOVE)){
	with(other){
		if(!dead){
			hp-=1;
			flash = 3;
			spd_array[1] = 1;
			dir_array[1] = other.direction;
			amt_array[1] = 10;
			xsc_array[1] = sign(dir_array[1]);
			new_move = true;
			if(hp <= 0){
				dead = true;
				var dir = other.direction;
				with(instance_create_layer(x, y, "Dead", object_dead)){
					direction = dir;
					speed = 3;
				}

				dead_pickup(self, false, false, objSpecial_Pellet);
		
				screen_shake(5,8,0.4,0.4,8);
				instance_destroy();
			}
		}
	}
}