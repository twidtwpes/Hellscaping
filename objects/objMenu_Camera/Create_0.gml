function menu_shake(){
	shake_length = 4;
	shake_magnitude = 8;
	shake_remain = 8;
}

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);
width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
menu_shake();