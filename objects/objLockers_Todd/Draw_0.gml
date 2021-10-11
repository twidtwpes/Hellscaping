draw_sprite_ext(sptTitle_ToddShadow, 1, x, y, 1, 1, 0, c_white, 0.6);


draw_sprite_ext(sprite_index, image_index, x - 7, y - 7, 1, 1, 0, c_black, 0.3);
draw_self();

if(image_index > 0.5 && image_index < 1.5){
	draw_sprite_ext(sptTitle_ToddHead, 0, x - 7, y - 4, 1, 1, 0, c_black, 0.3);
	draw_sprite_ext(sptTitle_ToddHead, 0, x, y-2, 1, 1, 0, c_white, 1);
}else{
	draw_sprite_ext(sptTitle_ToddHead, 0, x - 7, y - 2, 1, 1, 0, c_black, 0.3);
	draw_sprite_ext(sptTitle_ToddHead, 0, x, y, 1, 1, 0, c_white, 1);
}