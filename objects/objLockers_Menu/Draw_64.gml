color_weapon = make_color_rgb(217, 27, 42);
color_special = make_color_rgb(47, 175, 170);
color_ultra = make_color_rgb(171, 156, 94);
color_start = make_color_rgb(136, 0, 21);

draw_set_font(fntMessage);

switch(menu_cursor){
	case 0:
		draw_set_color(color_start);
		info_option = "LET'S GO!";
		info_msg = "";
		break;
	case 1:
		draw_set_color(color_weapon);
		info_option = "WEAPON";
		info_msg = "Open lockers with collected Weapon pellets. Selecting a locker starts you with that weapon (max of two).";
		break;
	case 2:
		draw_set_color(color_special);
		info_option = "SPECIAL";
		info_msg = "Open lockers with collected Special pellets. Selecting a locker guarantees that special will become available during the first round.";
		break;
	case 3:
		draw_set_color(color_ultra);
		info_option = "ULTRA";
		info_msg = "Open lockers with collected Ultra pellets. Selecting a locker gives you that Ultra (max one).";
		break;
}


draw_set_valign(fa_top);
if(menu_cursor != 0){
	draw_set_halign(fa_center);
	draw_text(390, 230, info_item);
}
draw_set_halign(fa_left);
draw_text(12, 230, info_option);
draw_text_ext(12, 250, info_msg, 15, 450);


draw_set_color(color_weapon);
draw_text(35, 298, objSettings_Tracker.stats[? "weapon_pellets"]);
draw_set_color(color_special);
draw_text(100, 298, objSettings_Tracker.stats[? "special_pellets"]);
draw_set_color(color_ultra);
draw_text(165, 298, objSettings_Tracker.stats[? "ultra_pellets"]);
