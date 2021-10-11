if(!hascontrol) exit;
	
#region Check Death
recovery_remain--;
if(hp <= 0){
	room_goto(rmEndLevel);
}
#endregion Check Death

#region Get Player Input
var key_left = false;
var key_right = false;
var key_up = false;
var key_down = false;
var key_enter = false;
	

if(objSettings_Tracker.settings[? "controls"] == 0){
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	key_enter = keyboard_check_pressed(vk_enter);
}else{
	key_left = gamepad_button_check_pressed(0,gp_padl);
	key_right = gamepad_button_check_pressed(0,gp_padr);
	key_up = gamepad_button_check_pressed(0,gp_padu);
	key_down = gamepad_button_check_pressed(0,gp_padd);
	key_enter = gamepad_button_check_pressed(0,gp_face1);
}
	
if(objSettings_Tracker.settings[? "controls"] == 1){
	if(abs(gamepad_axis_value(0,gp_axislh)) > 0.2){
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
	}
	if(abs(gamepad_axis_value(0,gp_axislv)) > 0.2){
		key_up = abs(min(gamepad_axis_value(0,gp_axislv),0));
		key_down = max(gamepad_axis_value(0,gp_axislv),0);
	}
}

var _x_input = key_right - key_left;
var _y_input = key_down - key_up;
	
x_speed_ += _x_input * acceleration_;
y_speed_ += _y_input * acceleration_;
#endregion Get Player Input

#region Calculate Movement
var _speed = point_distance(0, 0, x_speed_, y_speed_);
var _direction = point_direction(0, 0, x_speed_, y_speed_);
if(_speed > max_speed_){
	x_speed_ = lengthdir_x(max_speed_, _direction);
	y_speed_ = lengthdir_y(max_speed_, _direction);
}

if(_x_input == 0){
	x_speed_ = lerp(x_speed_, 0, .2);
}
if(_y_input == 0){
	y_speed_ = lerp(y_speed_, 0, .2);
}

if(_x_input == 0 && _y_input ==0){
	sprite_index = sptToddIdel;
	image_speed = 0.7;
}else{
	sprite_index = sptToddWalk;
	image_speed = 0.7;
}
#endregion Calculate Movement

#region Set Gun
currentGun = REVOLVER;
gunsprite =  guns[currentGun, GUNSPRITE];
reloadtime =  guns[currentGun, RELOADTIME];
recoilstart =  guns[currentGun, RECOILSTART];
shotamount =  guns[currentGun, SHOTAMOUNT];
shotspread =  guns[currentGun, SHOTSPREAD];
shotspeed =  guns[currentGun, SHOTSPEED];
shottimetodie =  guns[currentGun, SHOTTIMETODIE];
attackpoints = guns[REVOLVER, ATTACKPOINTS];
#endregion Set Gun

#region Update Gun
if(objSettings_Tracker.settings[? "controls"] == 0){
	gunangle = point_direction(x,y,mouse_x,mouse_y);
}else{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	gunangle = point_direction(0,0,controllerh,controllerv);
}
#endregion Update Gun

#region Move Target
with(objTarget){
	x = other.x;
	y = other.y;
	x = x + lengthdir_x(80,other.gunangle);
	y = y + lengthdir_y(80,other.gunangle);
}
#endregion Move Target

#region Fire Gun
currentreload++;
currentrecoil = 0;
if(!mouse_check_button(mb_left) && !gamepad_button_check(0,gp_shoulderrb)){
	firing = false;
	currentshot = -1;
}
if(objSettings_Tracker.settings[? "controls"] == 0){
	var fire = mouse_check_button(mb_left);
}else{
	var fire = gamepad_button_check(0,gp_shoulderrb);
}
if(fire && currentreload > reloadtime){
	firing = true;
	if(currentshot == -1) currentshot = 0;
	if(currentshot > -1) currentshot++;
	if(currentshot <= shotamount){
		screen_shake(2,7,0.2,0.2,10);
		with(instance_create_layer(x, y, "Bullets", objBulletRevolver)){
			sp = other.shotspeed;
			direction = other.gunangle + random_range(-other.shotspread,other.shotspread);
			image_angle = direction;
			ap = other.attackpoints;
		}
		//audio_play_sound(sndRevolver, 15, false);
		var casing = irandom(2);
		with(instance_create_layer(x, y, "EnemiesUnderground", objBulletCasings)){
			image_speed = 0;
			image_index = casing;
			speed = 2;
			direction = 90 + (45 * sign(other.image_xscale));
		}
		currentrecoil = recoilstart;
	}else{
		currentreload = 0;
	}
}
#endregion Fire Gun

#region Check Collisions/Move
if(hit_now){
	hit_amt--;
	if(hit_amt <= 0) hit_now = false;
	if(x_speed_ == 0 && y_speed_ == 0){
		
		x_speed_ = lengthdir_x(hit_spd, hit_dir);
		y_speed_ = lengthdir_y(hit_spd, hit_dir);
	}
}

x_speed_ -= lengthdir_x(currentrecoil, gunangle);
if(place_meeting(x+x_speed_,y,objEnemyUnderground)){
	x += (x_speed_/2);
	water = 30;
}else{
	x += x_speed_;
}
if(x_speed_ > 0){
	image_xscale = 1;
	if(grid_place_meeting(self, objLevelOne.grid_)){
		x = bbox_right&~(CELL_WIDTH-1);
		x -= bbox_right-x;
		x_speed_ = 0;
	}
}else if (x_speed_ < 0){
	image_xscale = -1;
	if(grid_place_meeting(self, objLevelOne.grid_)){
		x = bbox_left&~(CELL_WIDTH-1);
		x += CELL_WIDTH+x-bbox_left;
		x_speed_ = 0;
	}
}

y_speed_ -= lengthdir_y(currentrecoil, gunangle);
if(place_meeting(x,y+y_speed_,objEnemyUnderground)){
	y += (y_speed_/2);
	water = 30;
}else{
	y += y_speed_;
}
if(y_speed_ > 0){
	if(grid_place_meeting(self, objLevelOne.grid_)){
		y = bbox_bottom&~(CELL_HEIGHT-1);
		y -= bbox_bottom-y;
		y_speed_ = 0;
	}
}else if (y_speed_ < 0){
	if(grid_place_meeting(self, objLevelOne.grid_)){
		y = bbox_top&~(CELL_HEIGHT-1);
		y += CELL_HEIGHT+y-bbox_top;
		y_speed_ = 0;
	}
}
#endregion Check Collisions/Move
