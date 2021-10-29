draw_sprite_ext(sptSpecial_Flame, image_index, x, y, 1, 1, 0, c_white, 1);
draw_self();

with(objTorchHighlight){
	image_alpha = other.image_alpha;
}
