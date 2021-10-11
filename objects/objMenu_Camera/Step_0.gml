x = lerp(x, 25, .1);
y = lerp(y, 20, .1);

x = clamp(x, 0, 50);
y = clamp(y, 0, 40);
camera_set_view_pos(view_camera[0], x, y);

//Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));