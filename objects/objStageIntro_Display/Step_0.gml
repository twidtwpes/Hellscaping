if(fadeout){
	alpha -= fade_amount;
}else{
	alpha += fade_amount;
}

if(alpha > 1){
	alpha = 1;
	fadeout = true;
}
if(alpha < 0){
	alpha = 0;
	fadeout = false;
}

objStageIntro_Background.image_alpha = alpha;

if(wait(stime, 3)) room_goto(rmLevelOne);