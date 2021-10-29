var yy = 146;
var xx = 0;
var x_spacer = 64;
var xs = 0;

switch(specials_count){
	case 1: xx = 240; break;
	case 2: xx = 200; break;
	case 3: xx = 176; break;
	case 4: xx = 140; break;
	case 5: xx = 114; break;
}

xs = xx + (selected * x_spacer);
draw_sprite_ext(sptSpecial_SelectGlow, 0, xs, yy, 1, 1, 0, c_white, objSpecial_Flame.image_alpha);
draw_sprite(sptSpecial_Select, 0, xs, yy);

for(var i = 0; i < specials_count; i++){
	draw_sprite_ext(specials[i], 0, xx, yy, 2, 2, 0, c_white, 1);
	xx += x_spacer;
}

var ss = get_special_index(specials[selected]);
var tx = get_special_string(ss);

draw_set_font(fntMessage);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(240, 190, tx);

if(menu_committed){
	if(flash > 0){
		flash--;
		shader_set(shdTeal);
		draw_sprite_ext(specials[selected], 0, xs, yy, 2, 2, 0, c_white, 1);
		draw_sprite(sptSpecial_SelectGlow, 0, xs, yy);
		draw_sprite(sptSpecial_Select, 0, xs, yy);
		shader_reset();
	}else{
		room_goto(rmStageIntro);
	}
}