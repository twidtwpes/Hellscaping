if(!hascontrol) exit;

color_weapon = make_color_rgb(217, 27, 42);
color_special = make_color_rgb(47, 175, 170);
color_ultra = make_color_rgb(171, 156, 94);

//draw_set_font(fntDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//draw_set_color(c_red);
//draw_text(10,10,hp);
var p = 5;
repeat(hp){
	draw_sprite_ext(sptHeart2, 0, p, 5, 1, 1, 0, c_white, 1);
	p += 15;
}

draw_sprite_ext(sptClipBacker, 0, 5, 30, 1, 1, 0, c_white, 1);
//draw_sprite_ext(sptClipInner, 0, 5, 20, 1, 1, 0, c_white, 1);
//draw_sprite_part(sprite, subimg, left, top, width, height, x, y);

var w = sprite_get_width(sptClipInner);
var h = sprite_get_height(sptClipInner);
//var ratio = ((reloadtime - currentreload) div reloadtime) * h;
var ratio = h - ((currentreload/reloadtime) * h);
draw_sprite_part(sptClipInner2, 0, 0, ratio, w, h-ratio, 5, 30+ratio); 
draw_sprite_ext(sptClipOuter2, 0, 5, 30, 1, 1, 0, c_white, 1);

draw_sprite(sptWeapons_Pellet, 0, 5, 70);
draw_sprite(sptSpecial_Pellet, 0, 5, 90);
draw_sprite(sptUltra_Pellet, 0, 5, 110);

draw_set_font(fntMessage);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(color_weapon);
draw_text(15, 65, objSettings_Tracker.stats[? "weapon_pellets"]);
draw_set_color(color_special);
draw_text(15, 83, objSettings_Tracker.stats[? "special_pellets"]);
draw_set_color(color_ultra);
draw_text(15, 103, objSettings_Tracker.stats[? "ultra_pellets"]);

draw_set_font(fntMessage);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var yy = 140;
if(array_length(specials_pickedup) > 0){
	special_blink_current++;
	if(special_blink_current > 20){
		special_blink = !special_blink;
		special_blink_current = 0;
	}
}
for(var i = 0; i < array_length(specials_pickedup); i++){
	if(specials_pickedup_y[i] > yy){
		specials_pickedup_y[i] = lerp(specials_pickedup_y[i], yy, specials_pickup_speed);
		if(special_blink) draw_text(28,specials_pickedup_y[i] - 6,specials_pickedup_text[i]);
	}
	draw_sprite(specials_pickedup[i], 0, 12, specials_pickedup_y[i]);
	yy+=20;
}

var xx = 460;
for(var i = 0; i < array_length(specials_applied); i++){
	draw_sprite(specials_list[specials_applied[i]], 0, xx, 20);
	xx-=25;
}

//draw_text(150,10,startmelee);
//draw_text(150,10,fps);