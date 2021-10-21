sp = 0;
ap = 10;
image_speed = 0;
speed = sp;
smoke_interval = 0.01;
stime = get_timer();

with(instance_create_layer(x, y, "Bullets", objRocketFlame)){
	rocket = other;
}

