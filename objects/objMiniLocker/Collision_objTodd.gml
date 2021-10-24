if(sprite_index != spt_destroyed){
	//other.kick = true;
	var picks = [objDuelWield, objMoreHealth, objMulligan, objTelekenisis];
	var pick = irandom(array_length(picks) - 1);
	instance_create_layer(x,y,"Pickups",picks[pick]);
	sprite_index = spt_destroyed;
}