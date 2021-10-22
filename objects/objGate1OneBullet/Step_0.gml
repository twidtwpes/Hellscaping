
direction -= irandom_range(-1,-4);
image_angle += 20;

if(wait(timer,1.5) || grid_place_meeting(self, objLevelOne.grid_) || place_meeting(x, y, objFloorBorder)) image_speed = 1;

if(place_meeting(x, y, objMelee)) instance_destroy();