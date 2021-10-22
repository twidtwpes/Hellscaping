with(other){
	if(!dead){
		hp-=other.ap;
		flash = 3;
		spd_array[1] = 1;
		dir_array[1] = other.direction;
		amt_array[1] = 10;
		xsc_array[1] = sign(dir_array[1]);
		new_move = true;
		with(other){
			done = true;
		}
		if(hp <= 0){
			dead = true;
			var dir = other.direction;
			with(instance_create_layer(x, y, "Dead", object_dead)){
				direction = dir;
				speed = 10;
			}
		
			dead_pickup(self, true, true, objWeapons_Pellet);
		
			screen_shake(5,8,0.4,0.4,8);
			instance_destroy();
		}
	}
}