if(sprite_index != sptUltra_BoxDestroyed){
	sprite_index = sptUltra_BoxDestroyed;

	var spill = irandom_range(5, 10);
	for(var i = 0; i < spill; i++){
		instance_create_layer(x, y, "Pickups", objUltra_Pellet);
	}
}