with(objEnemyCrawl){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		var dir = other.direction;
		with(instance_create_layer(x, y, "Dead", objFetusDead)){
			direction = dir;
			speed = 10;
		}

		dead_pickup(self, true, true, objWeapons_Pellet);

		screen_shake(5,8,0.4,0.4,8);
		instance_destroy();
	}
}

with(objEnemyFlying){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		if(!explosion){
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
			explosion = true;
			stime = get_timer() - other.hit_buffer;
		}
	}
}

with(objEnemyGround){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		if(!explosion){
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
			explosion = true;
			stime = get_timer() - other.hit_buffer;
		}
	}
}

with(objFetusPod){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		if(!open){
			image_index = 1;
			open = true;
			instance_create_layer(x, y, "EnemiesGrounded", objFetus);
		}
	}
}

with(objGate1One){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		if(!destroyed){
			flash = 3;
			with(other){
				done = true;
			}
			destroyed = true;
			instance_create_layer(x, y, "EtraObjects", objGate1OneDestroyed);
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
}

with(objGate2One){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		if(!destroyed){
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
}

with(objSpecial_Box){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		if(sprite_index != sptSpecial_BoxDestroyed){
			sprite_index = sptSpecial_BoxDestroyed;
			image_alpha = 1;

			var spill = irandom_range(5, 10);
			for(var i = 0; i < spill; i++){
				instance_create_layer(x, y, "Pickups", objSpecial_Pellet);
			}
		}
	}
}

with(objUltra_Box){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		if(sprite_index != sptUltra_BoxDestroyed){
			sprite_index = sptUltra_BoxDestroyed;
			image_alpha = 1;

			var spill = irandom_range(5, 10);
			for(var i = 0; i < spill; i++){
				instance_create_layer(x, y, "Pickups", objUltra_Pellet);
			}
		}
	}
}

with(objWeapons_Box){
	if collision_line(other.sx, other.sy, other.ex, other.ey, id, false, false){
		if(sprite_index != sptWeapons_BoxDestroyed){
			sprite_index = sptWeapons_BoxDestroyed;

			var spill = irandom_range(5, 10);
			for(var i = 0; i < spill; i++){
				instance_create_layer(x, y, "Pickups", objWeapons_Pellet);
			}
		}
	}
}

if(saftydie > 1) instance_destroy();
saftydie++;