sx = x;
sy = y;

if(glowing) glow+=glow_interval; else glow-=glow_interval;
if(glow > 1) glowing = false;
if(glow < 0) glowing = true;

if(wait(stime, indextime)){
	index++;
	stime = get_timer();
}
if(index > 2) index = 0;
image_index = index;

sprite_set_offset(sptEnergyBeamGlow, sprite_get_xoffset(sptEnergyBeam), sprite_get_yoffset(sptEnergyBeam));

draw_self();
draw_sprite_ext(sptEnergyBeamGlow, image_index, x, y, 1, 1, direction, c_white, glow);

var bxx = [];
var byy = [];
for(var i = 0; i < 10; i++){
	var len = i * sprite_get_width(sptEnergyBeam);
	var xx = x + lengthdir_x(len, direction);
	var yy = y + lengthdir_y(len, direction);
	var cx = xx / CELL_WIDTH;
	var cy = yy / CELL_WIDTH;
	if(objLevelOne.grid_[# cx, cy] == VOID){
		i = 11;
	}else{
		//bix[i] = image_index + 1;
		bxx[i] = xx;
		byy[i] = yy;
	}
}
var bix = 0
for(var b = 1; b < array_length(bxx)-1; b++){
	bix = image_index + b;
	if(bix > 2) bix-=2; 
	draw_sprite_ext(sptEnergyBeam, bix, bxx[b], byy[b], 1, 1, direction, c_white, 1);
	draw_sprite_ext(sptEnergyBeamGlow, bix, bxx[b], byy[b], 1, 1, direction, c_white, glow);
}

ex = bxx[array_length(bxx)-1];
ey = byy[array_length(bxx)-1];


//draw_line_color(sx, sy, ex, ey, c_red, c_red);