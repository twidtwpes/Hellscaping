if(!hascontrol) exit;
	
#region Check Death
recovery_remain--;
if(hp <= 0){
	objSettings_Tracker.dead = true;
	dead = true;
	hascontrol = false;
}
#endregion Check Death

#region Get Player Input
var key_left = false;
var key_right = false;
var key_up = false;
var key_down = false;
var key_pickup = false;
var key_weapon = false;
var fire = false;
var release = false;
var secondary = false;
var bomb = false;
	
if(objSettings_Tracker.settings[? "controls"] == 0){
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	key_pickup = keyboard_check_pressed(vk_enter);
	key_weapon = keyboard_check_pressed(vk_space);
	fire = mouse_check_button(mb_left);
	release = mouse_check_button_released(mb_left);
	secondary = mouse_check_button(mb_right);
	bomb = keyboard_check_pressed(vk_control);
}else{
	key_left = gamepad_button_check_pressed(0, gp_padl);
	key_right = gamepad_button_check_pressed(0, gp_padr);
	key_up = gamepad_button_check_pressed(0, gp_padu);
	key_down = gamepad_button_check_pressed(0, gp_padd);
	key_pickup = gamepad_button_check_pressed(0, gp_face1);
	key_weapon = gamepad_button_check_pressed(0, gp_face4);
	fire = gamepad_button_check(0,gp_shoulderrb);
	release = gamepad_button_check_released(0,gp_shoulderrb);
	secondary = gamepad_button_check_released(0,gp_shoulderlb);
	bomb = gamepad_button_check_pressed(0,gp_shoulderl);
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

if(kick){
	if(kick_current == 0){
		sprite_index = sptTodd_Kick;
		screen_shake(6,10,0.4,0.4,12);
	}
	kick_current++;
	
	//if(ev_animation_end){
	//	image_speed = 0;
	//}else{
	//	image_speed = 1;
	//}
	
	if(kick_current > kick_hold){
		kick = false;
		kick_current = 0;
	}
}else{
	if(_x_input == 0 && _y_input ==0){
		sprite_index = sptToddIdel;
		image_speed = 0.7;
	}else{
		sprite_index = sptToddWalk;
		image_speed = 0.7;
	}
}
x_speed_ += x_portal;
y_speed_ += y_portal;
//if(kick){
//	x_speed_ = x_speed_ * kick_multiplier;
//	y_speed_ = y_speed_ * kick_multiplier;
//}
#endregion Calculate Movement

#region Set Gun
if(key_weapon){
	curwep++;
	if(curwep > 39) curwep = 0;
	set_weapon(curwep);
}
if(key_pickup){
	curwep--;
	if(curwep < 0) curwep = 39;
	set_weapon(curwep);
}
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
if(place_meeting(x + x_speed_, y, objFloorBorder)) x_speed_ = 0;
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
if(place_meeting(x, y + y_speed_, objFloorBorder)) y_speed_ = 0;
if(place_meeting(x,y+y_speed_,objEnemyUnderground) && !check_special(BOOTS)){
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

#region Fire Gun
currentreload++;
currentbuffer++;
currentrecoil = 0;

if(currentreload > reloadtime && firing = false){
	currentshot = 0;
}

if(release && beam){
	with(beamobj) instance_destroy();
}

if(fire){
	firing = true;
	if((currentshot < shotamount || shotamount == -1) && currentbuffer > shotbuffer){
		currentshot++
		screen_shake(bulletshake[0],bulletshake[1],bulletshake[2],bulletshake[3],bulletshake[4]);
		for(var i = 0; i < bulletamount; i++){
			var ba = bulletangle[i];
			var bi = bulletindex;
			sprite_set_offset(bulletspt, xorgin - x_speed_, yorgin);
			var beamexists = false;
			if(beam && instance_exists(beamobj)){
				with(beamobj){
					beamexists = true;
					var gw = glow;
					var gg = glowing;
					var st = stime;
					var ix = index;
					instance_destroy();
				}
			}
			with(instance_create_layer(x, y, "Bullets", bulletobj)){
				sp = other.shotspeed;
				direction = other.gunangle + random_range(-other.shotspread,other.shotspread) + ba;
				image_angle = direction + ba;
				ap = other.attackpoints;
				image_index = bi;
				other.beamobj = self;
				if(beamexists){
					glow = gw;
					glowing = gg;
					stime = st;
					index = ix;
				}
				if(other.melee != 0){
					image_yscale = other.xscale;
					other.startmelee = other.gunangle;
					other.currentmelee = 0;
					other.meleeaction = true;
				}
			}
		}
		//audio_play_sound(bulletsnd, 15, false);
		if(casings != noone){
			var casing_chance = irandom(casingfreq);
			if(casing_chance == 1){
				var casing = irandom(2);
				with(instance_create_layer(x, y, "EnemiesUnderground", casings)){
					image_speed = 0;
					image_index = casing;
					speed = 2;
					direction = 90 + (45 * sign(other.image_xscale));
				}
			}
		}
		currentrecoil = recoilstart;
		currentbuffer = 0;
		currentreload = 0;
	}
	
}else{
	firing = false;
}

#endregion Fire Gun

if(newstage){
	if(check_special(MOREHEALTH)) hp_max = 8;
	newstage = false;
}