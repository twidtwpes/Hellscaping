if(sprite_index != spt_destroyed){
	//other.kick = true;
	var picks = get_specials();
	var pick = irandom(array_length(picks) - 1);
	with(instance_create_layer(x,y,"Pickups",objSpecial)){
		special = pick;
		sprite_index = picks[pick];
	}
	sprite_index = spt_destroyed;
}