var dir = other.direction;
with(instance_create_layer(x, y, "Dead", objFetusDead)){
	direction = dir;
	speed = 10;
}

dead_pickup(self, true, true, objWeapons_Pellet);

screen_shake(5,8,0.4,0.4,8);
instance_destroy();
