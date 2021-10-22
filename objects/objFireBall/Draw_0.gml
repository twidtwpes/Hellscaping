if(glowing) glow+=glow_interval; else glow-=glow_interval;
if(glow > 1) glowing = false;
if(glow < 0) glowing = true;


sprite_set_offset(sptFireBallGlow, sprite_get_xoffset(sptFireBall), sprite_get_yoffset(sptFireBall));

draw_self();
draw_sprite_ext(sptFireBallGlow, image_index, x, y, 1, 1, direction, c_white, glow);