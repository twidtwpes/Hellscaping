if(glowing) glow+=glow_interval; else glow-=glow_interval;
if(glow > 1) glowing = false;
if(glow < 0.5) glowing = true;


sprite_set_offset(sptFireArrowGlow, sprite_get_xoffset(sptFireArrow), sprite_get_yoffset(sptFireArrow));

draw_self();
draw_sprite_ext(sptFireArrowGlow, image_index, x, y, 1, 1, direction, c_white, glow);