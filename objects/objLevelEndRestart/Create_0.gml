// Inherit the parent event
event_inherited();

if(objTrackEnemies.enemy_count == 0){
	objLevelEndGameOver.image_xscale = 0;
}else{
	objLevelEndYouWon.image_xscale = 0;
}