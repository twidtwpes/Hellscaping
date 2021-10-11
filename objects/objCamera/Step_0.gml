if not instance_exists(target_) exit;
x = lerp(x, target_.x, .1);
y = lerp(y, target_.y, .1);

x = clamp(x, width_/2 + CELL_WIDTH, room_width-width_/2 - CELL_WIDTH);
y = clamp(y, height_/2 + CELL_HEIGHT, room_height-height_/2 - CELL_HEIGHT);
camera_set_view_pos(view_camera[0], x-width_/2, y-height_/2);

//Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Set controller rumble
if(vibrate_remain > 0){
	gamepad_set_vibration(0,vibrate_left,vibrate_right);
	vibrate_remain--;
}else{
	gamepad_set_vibration(0,0,0);
	vibrate_left = 0;
	vibrate_right = 0;
}