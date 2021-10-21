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

//draw_text(100,20,x_portal);
//draw_text(100,50,y_portal);