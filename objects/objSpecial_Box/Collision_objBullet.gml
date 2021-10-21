
if(sprite_index != sptSpecial_BoxDestroyed){
	sprite_index = sptSpecial_BoxDestroyed;
	image_alpha = 1;

	var spill = irandom_range(5, 10);
	for(var i = 0; i < spill; i++){
		instance_create_layer(x, y, "Pickups", objSpecial_Pellet);
	}
}