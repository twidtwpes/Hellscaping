if(wait(stime, indextime)){
	index++;
	stime = get_timer();
}
if(index > 5) index = 0;
image_index = index;

if(glowing) glow+=glow_interval; else glow-=glow_interval;
if(glow > 1) glowing = false;
if(glow < 0) glowing = true;


sprite_set_offset(sptFlameGlow, sprite_get_xoffset(sptFlame), sprite_get_yoffset(sptFlame));

draw_self();
draw_sprite_ext(sptFlameGlow, image_index, x, y, 1, 1, direction, c_white, glow);