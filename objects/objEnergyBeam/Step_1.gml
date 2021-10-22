if((grid_place_meeting(self, objLevelOne.grid_) || place_meeting(x, y, objFloorBorder))){
	instance_destroy();
}

speed = 0;
sprite_set_offset(sptEnergyBeam, sprite_get_xoffset(sptEnergyBeamStart), sprite_get_yoffset(sptEnergyBeamStart));