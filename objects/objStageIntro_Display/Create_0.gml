if(objSettings_Tracker.dead){
	stage_end();
	objSettings_Tracker.dead = false;
}else{
	if(instance_exists(objTrackEnemies)) objTrackEnemies.previous_count = objSettings_Tracker.kills;
}

alpha = 0;
fadeout = false;
fade_amount = 0.02;
stime = get_timer();

level = objSettings_Tracker.level;
stage = objSettings_Tracker.stage;
kills = objSettings_Tracker.kills;

function get_stage_number(num){
	switch(num){
		case 0: return sptStageIntro_0; break;
		case 1: return sptStageIntro_1; break;
		case 2: return sptStageIntro_2; break;
		case 3: return sptStageIntro_3; break;
		case 4: return sptStageIntro_4; break;
		case 5: return sptStageIntro_5; break;
		case 6: return sptStageIntro_6; break;
		case 7: return sptStageIntro_7; break;
		case 8: return sptStageIntro_8; break;
		case 9: return sptStageIntro_9; break;
	}
}

with(instance_create_layer(247, 112, "Numbers", objStageIntro_Number)) sprite_index = get_stage_number(other.level);
with(instance_create_layer(285, 112, "Numbers", objStageIntro_Number)) sprite_index = get_stage_number(other.stage);

var n = kills;
var r = 0;
var i = 0;
var h = [];
do{
	r = n % 10
	h[i] = r;
	i++;
	n = (n - r) / 10;
}until(n == 0);

for(var j = (array_length(h)-1); j >= 0; j--){
	var num = h[j];
	with(instance_create_layer(252 + (17 * (array_length(h) - j - 1)), 202, "Numbers", objStageIntro_Number)) sprite_index = get_stage_number(num);
}