if(glowing) glow+=glow_interval; else glow-=glow_interval;
if(glow > 1) glowing = false;
if(glow < 0) glowing = true;


sprite_set_offset(sptEnergyGlow, sprite_get_xoffset(sptEnergy), sprite_get_yoffset(sptEnergy));

draw_self();
draw_sprite_ext(sptEnergyGlow, image_index, x, y, 1, 1, direction, c_white, glow);