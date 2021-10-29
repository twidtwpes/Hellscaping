draw_sprite_ext(sptTitle_ToddShadow, 1, x, y, 1, 1, 0, c_white, 0.6);

if(objSpecials_Control.menu_committed && objSpecials_Control.flash > 0) shader_set(shdTeal);
draw_self();

if(image_index > 0.5 && image_index < 1.5){
	draw_sprite_ext(sptTitle_ToddHead, 0, x, y-2, 1, 1, 0, c_white, 1);
	draw_sprite_ext(sptSpecials_ToddHead, 0, x, y-2, 1, 1, 0, c_white, objSpecial_Flame.image_alpha);
}else{
	draw_sprite_ext(sptTitle_ToddHead, 0, x, y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(sptSpecials_ToddHead, 0, x, y, 1, 1, 0, c_white, objSpecial_Flame.image_alpha);
}

shader_reset();
