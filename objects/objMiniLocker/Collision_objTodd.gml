if(sprite_index != spt_destroyed){
	//other.kick = true;
	var picks = [objDuelWield_Pickup, objMoreHealth_Pickup, objMulligan_Pickup, objTelekenisis_Pickup];
	var pick = irandom(array_length(picks) - 1);
	instance_create_layer(x,y,"Pickups",picks[pick]);
	sprite_index = spt_destroyed;
}