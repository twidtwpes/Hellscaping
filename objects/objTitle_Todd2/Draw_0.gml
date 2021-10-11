if(head == sptTitle_ToddHead){
	var shadow = 1;
}else{
	var shadow = 0;
}
draw_sprite_ext(sptTitle_ToddShadow, shadow, x, y, 1, 1, 0, c_white, 0.6);


draw_sprite_ext(sprite_index, image_index, x - 7, y - 7, 1, 1, 0, c_black, 0.3);
draw_self();

if(image_index > 0.5 && image_index < 1.5){
	draw_sprite_ext(head, 0, x - 7, y - 4, 1, 1, 0, c_black, 0.3);
	draw_sprite_ext(head, 0, x, y-2, 1, 1, 0, c_white, 1);
}else{
	draw_sprite_ext(head, 0, x - 7, y - 2, 1, 1, 0, c_black, 0.3);
	draw_sprite_ext(head, 0, x, y, 1, 1, 0, c_white, 1);
}

if(get_gun && wait(stime,1)){
	draw_sprite_ext(sptTitle_ToddGun, 0, x+20, y+70, 1, 1, gun_angle, c_white, 1);
	if(gun_angle > 0) gun_angle-=8;
	//draw_sprite_ext(sptTitle_ToddGun, 0, x+20, y+70, 1, 1, 135, c_white, 1);
}