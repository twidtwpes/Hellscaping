if(recovery_remain < 0){
	hp-=other.ap;
	recovery_remain = recovery;
	flash = 5;
	hit_dir = other.direction;
	hit_spd = 1;
	hit_amt = 10;
	hit_now = true;
	screen_shake(6,10,0.4,0.4,12);
}
