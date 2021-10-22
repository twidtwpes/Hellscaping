if(!hascontrol){
	if(done && image_xscale > 0) image_xscale -= 0.1;
	if(dead){
		draw_sprite(sptTodd_Dead, 0, x, y);
		exit;
	}
}


draw_sprite_ext(sptToddShadow, 0, x, y+19, image_xscale, -.75, 0, c_white, .4);

draw_self();

// Set all white
if(flash > 0){
	flash--;
	shader_set(shdWhite);
	draw_self();
}

gunplaceangle = gunangle;
if(gunangle > 90 && gunangle < 270){
	xscale = -1;
	gunangle += xscale*180;
}else{
	xscale = 1;
}

if(meleeaction && currentmelee < melee){
	currentmelee += (melee / (sprite_get_speed(sptEnergy_Melee) * sprite_get_number(sptEnergy_Melee)) * 4);
	if(xscale == 1) gunangle = startmelee + melee - currentmelee;
	else gunangle = startmelee + melee + currentmelee;
}
//fps

if(done){
	draw_sprite_ext(sptToddHead, 0, x+image_xscale, y+1, image_xscale, 1, 0, c_white, 1);
	
}else{
	if(currentreload < reloadtime) var inx = reloadindex; else var inx = 1;
	if(gunplaceangle > 0 && gunplaceangle <= 180){
		draw_sprite_ext(gunsprite, inx, x, y, xscale, 1, gunangle, c_white, 1);
		draw_sprite_ext(sptToddHead, 0, x+image_xscale, y+1, xscale, 1, 0, c_white, 1);
	}else{
		draw_sprite_ext(sptToddHead, 0, x+image_xscale, y+1, xscale, 1, 0, c_white, 1);
		draw_sprite_ext(gunsprite, inx, x, y, xscale, 1, gunangle, c_white, 1);
	}
}

if(sprite_index == sptToddWalk && water > 0){
	draw_sprite_ext(sptToddWaterWalk, image_index, x, y, xscale, 1, 0, c_white, 1);
	if(footprints < 0){
		with(instance_create_layer(floor(x), floor(y), "EnemiesUnderground", objWaterFootsteps)){
			image_angle = other.direction;
			image_xscale = other.image_xscale;
		}
		footprints = 10;
	}
	footprints--;
}
if(sprite_index == sptToddIdel && water > 0){
	draw_sprite_ext(sptToddWaterIdle, image_index, x, y, xscale, 1, 0, c_white, 1);
}
water--;

shader_reset();