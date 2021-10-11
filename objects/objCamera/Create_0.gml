target_ = objTodd;
width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

vibrate_right = 0;
vibrate_left = 0;
vibrate_remain = 0;