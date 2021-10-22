if(index == 2 || index == 5){
	var smoke = irandom(2);
	if(smoke == 2){
		with(instance_create_layer(x, y + 8, "Bullets", objSmoke)){
			speed = 1;
			var veer = random_range(-2, 2);
			direction = 135 + veer;
		}
	}
}

if(saftydie > 1) instance_destroy();
saftydie++;