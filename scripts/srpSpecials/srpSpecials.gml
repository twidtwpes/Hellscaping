#macro AMMOHITS 0//enemies drop more ammo-
#macro ATTRACT 1//pickups attract from further away-
#macro BONEBREAKER 2//enemies have less hp-
#macro BOOTS 3//walk on all services-
#macro DEADSHOVE 4//dead bodies fly further and hurt enemies-
#macro DOUBLEUP 5//
#macro DUELWIELDEACH 6//duel wield melee with gun
#macro DUELWIELDGUNS 7//duel wield two guns
#macro DUELWIELDMELEE 8//duel wield two melee
#macro ENERGYFIELD 9//enemies damaged when too close
#macro FIREPROOF 10//explosions and fire dont do damage
#macro HEALTHHITS 11//enemies drop more health
#macro LONGREACH 12//melee has longer reach
#macro MOREAMMO 13//ammo max goes up
#macro MOREHEALTH 14//health max goes up
#macro MULLIGAN 15//two more hearts after death
#macro SENSITIVE 16//everyone has less hp
#macro RUNNER 17//faster walk speed
#macro SEEALL 18//enemies highlighted beyond screen
#macro SELFDESTRUCT 19//large explosion if 4 or more health and return with one health
#macro STRONGER 20//weapon hit points go up
#macro TELEKENISIS 21//push away bullets and pull in enemies
#macro TELEPORT 22//goes to cursor position
#macro TORCH 23//use three health to be on fire for a round
#macro WALLSHOOTER 24//all bullets destroy walls

#macro TORNADO 25//spin around with invincibility and cause damage
#macro SHIELD 26//deflects up to 5 bullets per round
#macro BOMBMAKER 27//turns dead bodies into bombs
#macro BULLETTIME 28//bullets slow down
#macro SLOWMO 29//enemies slow down
#macro SUMMON 30//summon creatures that hurt enemies
#macro LIFESAVER 31//when one hp ammo decreases to keep you alive
#macro SEEKER 32//bullets seek out enemies
#macro CHARGE 33//charges forward and hurts enemies and destroy walls
#macro STEELHEART 34//first hp per round is worth two hits
#macro PISTOLWHIP 35//knife attack with guns
#macro PISTOLDART 36//throw guns at enemies when out of bullets
#macro GASMASK 37//gas does not hurt you
#macro COMBATRELOAD 38//faster reload time for guns and melee

function get_specials(){
	var specials = [];
	specials[AMMOHITS] = sptAmmoHits_Special;
	specials[ATTRACT] = sptAttract_Special;
	specials[BONEBREAKER] = sptBoneBreaker_Special;
	specials[BOOTS] = sptBoots_Special;
	specials[DEADSHOVE] = sptDeadShove_Special;
	specials[DOUBLEUP] = sptDoubleUp_Special;
	specials[DUELWIELDEACH] = sptDuelWieldAll_Special;
	specials[DUELWIELDGUNS] = sptDuelWieldGuns_Special;
	specials[DUELWIELDMELEE] = sptDuelWieldMelee_Special;
	specials[ENERGYFIELD] = sptEnergyField_Special;
	specials[FIREPROOF] = sptFireproof_Special;
	specials[HEALTHHITS] = sptHealthHits_Special;
	specials[LONGREACH] = sptLongReach_Special;
	specials[MOREAMMO] = sptMoreAmmo_Special;
	specials[MOREHEALTH] = sptMoreHealth_Special;
	specials[MULLIGAN] = sptMulligan_Special;
	specials[SENSITIVE] = sptNull_Special;
	specials[RUNNER] = sptRunner_Special;
	specials[SEEALL] = sptSeeAll_Special;
	specials[SELFDESTRUCT] = sptSelfDestruct_Special;
	specials[STRONGER] = sptStronger_Special;
	specials[TELEKENISIS] = sptTelekenisis_Special;
	specials[TELEPORT] = sptTeleport_Special;
	specials[TORCH] = sptTorch_Special;
	specials[WALLSHOOTER] = sptWallShooter_Special;
	return specials;
}

function get_special_string(pick){
	var specials = [];
	specials[AMMOHITS] = "Ammo Hits";
	specials[ATTRACT] = "Attract";
	specials[BONEBREAKER] = "Bone Breaker";
	specials[BOOTS] = "Boots";
	specials[DEADSHOVE] = "Dead Shove";
	specials[DOUBLEUP] = "Double Up";
	specials[DUELWIELDEACH] = "Duel Wield Each";
	specials[DUELWIELDGUNS] = "Duel Wield Guns";
	specials[DUELWIELDMELEE] = "Duel Wield Melee";
	specials[ENERGYFIELD] = "Energy Field";
	specials[FIREPROOF] = "Fireproof";
	specials[HEALTHHITS] = "Health Hits";
	specials[LONGREACH] = "Long Reach";
	specials[MOREAMMO] = "More Ammo";
	specials[MOREHEALTH] = "More Health";
	specials[MULLIGAN] = "Mulligan";
	specials[SENSITIVE] = "Null";
	specials[RUNNER] = "Runner";
	specials[SEEALL] = "See All";
	specials[SELFDESTRUCT] = "Self Destruct";
	specials[STRONGER] = "Stronger";
	specials[TELEKENISIS] = "Telekenisis";
	specials[TELEPORT] = "Teleport";
	specials[TORCH] = "Torch";
	specials[WALLSHOOTER] = "Wall Shooter";
	return specials[pick];
}

function get_special_index(spt){
	var specials = [];
	specials[AMMOHITS] = sptAmmoHits_Special;
	specials[ATTRACT] = sptAttract_Special;
	specials[BONEBREAKER] = sptBoneBreaker_Special;
	specials[BOOTS] = sptBoots_Special;
	specials[DEADSHOVE] = sptDeadShove_Special;
	specials[DOUBLEUP] = sptDoubleUp_Special;
	specials[DUELWIELDEACH] = sptDuelWieldAll_Special;
	specials[DUELWIELDGUNS] = sptDuelWieldGuns_Special;
	specials[DUELWIELDMELEE] = sptDuelWieldMelee_Special;
	specials[ENERGYFIELD] = sptEnergyField_Special;
	specials[FIREPROOF] = sptFireproof_Special;
	specials[HEALTHHITS] = sptHealthHits_Special;
	specials[LONGREACH] = sptLongReach_Special;
	specials[MOREAMMO] = sptMoreAmmo_Special;
	specials[MOREHEALTH] = sptMoreHealth_Special;
	specials[MULLIGAN] = sptMulligan_Special;
	specials[SENSITIVE] = sptNull_Special;
	specials[RUNNER] = sptRunner_Special;
	specials[SEEALL] = sptSeeAll_Special;
	specials[SELFDESTRUCT] = sptSelfDestruct_Special;
	specials[STRONGER] = sptStronger_Special;
	specials[TELEKENISIS] = sptTelekenisis_Special;
	specials[TELEPORT] = sptTeleport_Special;
	specials[TORCH] = sptTorch_Special;
	specials[WALLSHOOTER] = sptWallShooter_Special;
	
	var inx = 0;
	for(var i = 0; i < array_length(specials); i++){
		if(specials[i] == spt) inx = i;
	}
	
	return inx;
}

function check_special(num){
	return check_array_value(objSettings_Tracker.specials_applied, num)
}