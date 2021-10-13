if(!entered){
	if(collision_circle(x, y, 2, objTodd, true, true)){
		entered = true;
		stime = get_timer();
		light = random_range(0.005, 0.03);
		other.done = true;
		other.flash = 50;
		other.hascontrol = false;
		other.image_xscale = 1;
		other.x = x;
		other.y = y - 15;
	}
}