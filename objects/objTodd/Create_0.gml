//Gun Macros
#macro REVOLVER 0
#macro SUBMACHINEGUN 1
#macro MACHINEGUN 2
#macro ASSAULTRIFFLE 3
#macro TRIPPLEMACHINEGUN 4
#macro BOW 5
#macro AUTOBOW 6
#macro DOUBLEBOW 7
#macro MULTIBOW 8
#macro METALBOW 9
#macro ROCKETLAUNCHER 10
#macro LARGEROCKETLAUNCHER 11
#macro GRENADELAUNCHER 12
#macro AUTOGRENADELAUNCHER 13
#macro ROCKETBOW 14
#macro HANDGRENADE 15
#macro BOMB 16
#macro ENERGYREVOLVER 17
#macro ENERGYSUBMACHINEGUN 18
#macro ENERGYMACHINEGUN 19
#macro ENERGYASSAULTRIFFLE 20
#macro ENERGYKATANA 21
#macro FLAMETHROWER 22
#macro FIRECANON 23
#macro TRIPPLEFIRECANON 24
#macro FIRELOBBER 25
#macro FIREBOW 26
#macro FIRESWORD 27
#macro KNIFE 28
#macro SWORD 29
#macro KATANA 30
#macro CLUB 31
#macro MALLET 32
#macro SLINGSHOT 33
#macro CATAPULT 34
#macro ROCKRAIL 35
#macro SHOTGUN 36
#macro SAWEDOFF 37
#macro DUELSHOTGUN 38
#macro AUTOSHOTGUN 39

#macro GUNSPRITE 0
#macro RELOADTIME 1
#macro RECOILSTART 2
#macro SHOTAMOUNT 3
#macro SHOTSPREAD 4
#macro SHOTSPEED 5
#macro SHOTBUFFER 6
#macro ATTACKPOINTS 7
#macro XORGIN 8
#macro YORGIN 9
#macro BULLETOBJ 10
#macro BULLETSPT 11
#macro BULLETSND 12
#macro BULLETSHAKE 13
#macro BULLETAMOUNT 14
#macro BULLETANGLE 15
#macro BULLETINDEX 16
#macro RELOADINDEX 17
#macro BEAM 18
#macro MELEE 19
#macro CASINGS 20
#macro CASINGFREQ 21

hp = 5;
hp_max = 5;

specials_pickedup = [];
specials_pickedup_xy = [];
specials_applied = [];

dead = false;
done = false;

// Movement vars
hit_dir = 0;
hit_spd = 0;
hit_amt = 0;
hit_now = false;
x_speed_ = 0;
y_speed_ = 0;
x_portal = 0;
y_portal = 0;
max_speed_ = 2;
acceleration_ = .5;
recovery_remain = 0;
flash = 0;
water = 0;
footprints = 0;
kick = false;
//kick_multiplier = 1.2;
kick_hold = 25;
kick_current = 0;

// Controller vars
controller = 0;
hascontrol = true;
gunangle = 0;
firing = false;
currentshot = -1;
currentreload = 0;
currentrecoil = 0;
currentbuffer = 0;
weapon_xoffset = 0;

// Gun vars
currentGun = noone;
gunsprite = 0;
reloadtime = 0;
recoilstart = 0;
shotamount = 0;
shotspread = 0;
shotspeed = 0;
shotbuffer = 0;
xorgin = 0;
yorgin = 0;
bulletobj = noone;
bulletspt = noone;
bulletsnd = noone;
bulletshake = [];
bulletamount = 0;
bulletangle = 0;
bulletindex = 0;
reloadindex = 0;
beam = false;
melee = 0;
casings = noone;
casingfreq = -1;

beamobj = noone;
xscale = 0;
startmelee = 0;
currentmelee = 0;
meleeaction = false;

#region Bullet Weapons
guns[REVOLVER, GUNSPRITE] = sptRevolver;
guns[REVOLVER, RELOADTIME] = 10;
guns[REVOLVER, RECOILSTART] = 0;
guns[REVOLVER, SHOTAMOUNT] = 1;
guns[REVOLVER, SHOTSPREAD] = 0;
guns[REVOLVER, SHOTSPEED] = 10;
guns[REVOLVER, SHOTBUFFER] = 30;
guns[REVOLVER, ATTACKPOINTS] = 1;
guns[REVOLVER, XORGIN] = -10;
guns[REVOLVER, YORGIN] = 11;
guns[REVOLVER, BULLETOBJ] = objBullet;
guns[REVOLVER, BULLETSPT] = sptBullet;
guns[REVOLVER, BULLETSND] = sndRevolver;
guns[REVOLVER, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[REVOLVER, BULLETAMOUNT] = 1;
guns[REVOLVER, BULLETANGLE] = [0];
guns[REVOLVER, BULLETINDEX] = 0;
guns[REVOLVER, BULLETINDEX] = 0;
guns[REVOLVER, RELOADINDEX] = 1;
guns[REVOLVER, BEAM] = false;
guns[REVOLVER, MELEE] = 0;
guns[REVOLVER, CASINGS] = objBulletCasings;
guns[REVOLVER, CASINGFREQ] = 1;

guns[SUBMACHINEGUN, GUNSPRITE] = sptSubMachine;
guns[SUBMACHINEGUN, RELOADTIME] = 30;
guns[SUBMACHINEGUN, RECOILSTART] = 0;
guns[SUBMACHINEGUN, SHOTAMOUNT] = 3;
guns[SUBMACHINEGUN, SHOTSPREAD] = 3;
guns[SUBMACHINEGUN, SHOTSPEED] = 10;
guns[SUBMACHINEGUN, SHOTBUFFER] = 3;
guns[SUBMACHINEGUN, ATTACKPOINTS] = 1;
guns[SUBMACHINEGUN, XORGIN] = -13;
guns[SUBMACHINEGUN, YORGIN] = 11;
guns[SUBMACHINEGUN, BULLETOBJ] = objBullet;
guns[SUBMACHINEGUN, BULLETSPT] = sptBullet;
guns[SUBMACHINEGUN, BULLETSND] = sndRevolver;
guns[SUBMACHINEGUN, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[SUBMACHINEGUN, BULLETAMOUNT] = 1;
guns[SUBMACHINEGUN, BULLETANGLE] = [0];
guns[SUBMACHINEGUN, BULLETINDEX] = 0;
guns[SUBMACHINEGUN, RELOADINDEX] = 1;
guns[SUBMACHINEGUN, BEAM] = false;
guns[SUBMACHINEGUN, MELEE] = 0;
guns[SUBMACHINEGUN, CASINGS] = objBulletCasings;
guns[SUBMACHINEGUN, CASINGFREQ] = 1;

guns[MACHINEGUN, GUNSPRITE] = sptMachineGun;
guns[MACHINEGUN, RELOADTIME] = 1;
guns[MACHINEGUN, RECOILSTART] = 0;
guns[MACHINEGUN, SHOTAMOUNT] = -1;
guns[MACHINEGUN, SHOTSPREAD] = 4;
guns[MACHINEGUN, SHOTSPEED] = 10;
guns[MACHINEGUN, SHOTBUFFER] = 5;
guns[MACHINEGUN, ATTACKPOINTS] = 1;
guns[MACHINEGUN, XORGIN] = -20;
guns[MACHINEGUN, YORGIN] = 11;
guns[MACHINEGUN, BULLETOBJ] = objBullet;
guns[MACHINEGUN, BULLETSPT] = sptBullet;
guns[MACHINEGUN, BULLETSND] = sndRevolver;
guns[MACHINEGUN, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[MACHINEGUN, BULLETAMOUNT] = 1;
guns[MACHINEGUN, BULLETANGLE] = [0];
guns[MACHINEGUN, BULLETINDEX] = 0;
guns[MACHINEGUN, RELOADINDEX] = 1;
guns[MACHINEGUN, BEAM] = false;
guns[MACHINEGUN, MELEE] = 0;
guns[MACHINEGUN, CASINGS] = objBulletCasings;
guns[MACHINEGUN, CASINGFREQ] = 2;

guns[ASSAULTRIFFLE, GUNSPRITE] = sptAssault;
guns[ASSAULTRIFFLE, RELOADTIME] = 1;
guns[ASSAULTRIFFLE, RECOILSTART] = 0;
guns[ASSAULTRIFFLE, SHOTAMOUNT] = -1;
guns[ASSAULTRIFFLE, SHOTSPREAD] = 2;
guns[ASSAULTRIFFLE, SHOTSPEED] = 10;
guns[ASSAULTRIFFLE, SHOTBUFFER] = 9;
guns[ASSAULTRIFFLE, ATTACKPOINTS] = 3;
guns[ASSAULTRIFFLE, XORGIN] = -20;
guns[ASSAULTRIFFLE, YORGIN] = 11;
guns[ASSAULTRIFFLE, BULLETOBJ] = objBullet;
guns[ASSAULTRIFFLE, BULLETSPT] = sptBullet;
guns[ASSAULTRIFFLE, BULLETSND] = sndRevolver;
guns[ASSAULTRIFFLE, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[ASSAULTRIFFLE, BULLETAMOUNT] = 1;
guns[ASSAULTRIFFLE, BULLETANGLE] =[0];
guns[ASSAULTRIFFLE, BULLETINDEX] = 0;
guns[ASSAULTRIFFLE, RELOADINDEX] = 1;
guns[ASSAULTRIFFLE, BEAM] = false;
guns[ASSAULTRIFFLE, MELEE] = 0;
guns[ASSAULTRIFFLE, CASINGS] = objBulletCasings;
guns[ASSAULTRIFFLE, CASINGFREQ] = 2;

guns[TRIPPLEMACHINEGUN, GUNSPRITE] = sptTripleMachine;
guns[TRIPPLEMACHINEGUN, RELOADTIME] = 1;
guns[TRIPPLEMACHINEGUN, RECOILSTART] = 0;
guns[TRIPPLEMACHINEGUN, SHOTAMOUNT] = -1;
guns[TRIPPLEMACHINEGUN, SHOTSPREAD] = 1;
guns[TRIPPLEMACHINEGUN, SHOTSPEED] = 10;
guns[TRIPPLEMACHINEGUN, SHOTBUFFER] = 5;
guns[TRIPPLEMACHINEGUN, ATTACKPOINTS] = 1;
guns[TRIPPLEMACHINEGUN, XORGIN] = -20;
guns[TRIPPLEMACHINEGUN, YORGIN] = 11;
guns[TRIPPLEMACHINEGUN, BULLETOBJ] = objBullet;
guns[TRIPPLEMACHINEGUN, BULLETSPT] = sptBullet;
guns[TRIPPLEMACHINEGUN, BULLETSND] = sndRevolver;
guns[TRIPPLEMACHINEGUN, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[TRIPPLEMACHINEGUN, BULLETAMOUNT] = 3;
guns[TRIPPLEMACHINEGUN, BULLETANGLE] = [-8,0,8];
guns[TRIPPLEMACHINEGUN, BULLETINDEX] = 0;
guns[TRIPPLEMACHINEGUN, RELOADINDEX] = 1;
guns[TRIPPLEMACHINEGUN, BEAM] = false;
guns[TRIPPLEMACHINEGUN, MELEE] = 0;
guns[TRIPPLEMACHINEGUN, CASINGS] = objBulletCasings;
guns[TRIPPLEMACHINEGUN, CASINGFREQ] = 2;
#endregion Bullet Weapons

#region Bolt Weapons
guns[BOW, GUNSPRITE] = sptBow;
guns[BOW, RELOADTIME] = 30;
guns[BOW, RECOILSTART] = 0;
guns[BOW, SHOTAMOUNT] = 1;
guns[BOW, SHOTSPREAD] = 0;
guns[BOW, SHOTSPEED] = 10;
guns[BOW, SHOTBUFFER] = 30;
guns[BOW, ATTACKPOINTS] = 3;
guns[BOW, XORGIN] = -10;
guns[BOW, YORGIN] = 3;
guns[BOW, BULLETOBJ] = objArrow;
guns[BOW, BULLETSPT] = sptArrow;
guns[BOW, BULLETSND] = sndRevolver;
guns[BOW, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[BOW, BULLETAMOUNT] = 1;
guns[BOW, BULLETANGLE] = [0];
guns[BOW, BULLETINDEX] = 0;
guns[BOW, RELOADINDEX] = 1;
guns[BOW, BEAM] = false;
guns[BOW, MELEE] = 0;
guns[BOW, CASINGS] = noone;
guns[BOW, CASINGFREQ] = -1;

guns[AUTOBOW, GUNSPRITE] = sptAutoBow;
guns[AUTOBOW, RELOADTIME] = 1;
guns[AUTOBOW, RECOILSTART] = 0;
guns[AUTOBOW, SHOTAMOUNT] = -1;
guns[AUTOBOW, SHOTSPREAD] = 4;
guns[AUTOBOW, SHOTSPEED] = 10;
guns[AUTOBOW, SHOTBUFFER] = 10;
guns[AUTOBOW, ATTACKPOINTS] = 3;
guns[AUTOBOW, XORGIN] = -10;
guns[AUTOBOW, YORGIN] = 3;
guns[AUTOBOW, BULLETOBJ] = objArrow;
guns[AUTOBOW, BULLETSPT] = sptArrow;
guns[AUTOBOW, BULLETSND] = sndRevolver;
guns[AUTOBOW, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[AUTOBOW, BULLETAMOUNT] = 1;
guns[AUTOBOW, BULLETANGLE] = [0];
guns[AUTOBOW, BULLETINDEX] = 0;
guns[AUTOBOW, RELOADINDEX] = 1;
guns[AUTOBOW, BEAM] = false;
guns[AUTOBOW, MELEE] = 0;
guns[AUTOBOW, CASINGS] = noone;
guns[AUTOBOW, CASINGFREQ] = -1;

guns[DOUBLEBOW, GUNSPRITE] = sptDoubleBow;
guns[DOUBLEBOW, RELOADTIME] = 30;
guns[DOUBLEBOW, RECOILSTART] = 0;
guns[DOUBLEBOW, SHOTAMOUNT] = 1;
guns[DOUBLEBOW, SHOTSPREAD] = 1;
guns[DOUBLEBOW, SHOTSPEED] = 10;
guns[DOUBLEBOW, SHOTBUFFER] = 30;
guns[DOUBLEBOW, ATTACKPOINTS] = 3;
guns[DOUBLEBOW, XORGIN] = -10;
guns[DOUBLEBOW, YORGIN] = 3;
guns[DOUBLEBOW, BULLETOBJ] = objArrow;
guns[DOUBLEBOW, BULLETSPT] = objArrow;
guns[DOUBLEBOW, BULLETSND] = sndRevolver;
guns[DOUBLEBOW, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[DOUBLEBOW, BULLETAMOUNT] = 2;
guns[DOUBLEBOW, BULLETANGLE] = [-4,4];
guns[DOUBLEBOW, BULLETINDEX] = 0;
guns[DOUBLEBOW, RELOADINDEX] = 1;
guns[DOUBLEBOW, BEAM] = false;
guns[DOUBLEBOW, MELEE] = 0;
guns[DOUBLEBOW, CASINGS] = noone;
guns[DOUBLEBOW, CASINGFREQ] = -1;

guns[MULTIBOW, GUNSPRITE] = sptMultiBow;
guns[MULTIBOW, RELOADTIME] = 30;
guns[MULTIBOW, RECOILSTART] = 0;
guns[MULTIBOW, SHOTAMOUNT] = 1;
guns[MULTIBOW, SHOTSPREAD] = 1;
guns[MULTIBOW, SHOTSPEED] = 10;
guns[MULTIBOW, SHOTBUFFER] = 30;
guns[MULTIBOW, ATTACKPOINTS] = 3;
guns[MULTIBOW, XORGIN] = -10;
guns[MULTIBOW, YORGIN] = 3;
guns[MULTIBOW, BULLETOBJ] = objArrow;
guns[MULTIBOW, BULLETSPT] = objArrow;
guns[MULTIBOW, BULLETSND] = sndRevolver;
guns[MULTIBOW, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[MULTIBOW, BULLETAMOUNT] = 6;
guns[MULTIBOW, BULLETANGLE] = [-8,-4,0,4,8,12];
guns[MULTIBOW, BULLETINDEX] = 0;
guns[MULTIBOW, RELOADINDEX] = 1;
guns[MULTIBOW, BEAM] = false;
guns[MULTIBOW, MELEE] = 0;
guns[MULTIBOW, CASINGS] = noone;
guns[MULTIBOW, CASINGFREQ] = -1;

guns[METALBOW, GUNSPRITE] = sptMetalBow;
guns[METALBOW, RELOADTIME] = 30;
guns[METALBOW, RECOILSTART] = 0;
guns[METALBOW, SHOTAMOUNT] = 1;
guns[METALBOW, SHOTSPREAD] = 0;
guns[METALBOW, SHOTSPEED] = 10;
guns[METALBOW, SHOTBUFFER] = 30;
guns[METALBOW, ATTACKPOINTS] = 5;
guns[METALBOW, XORGIN] = -10;
guns[METALBOW, YORGIN] = 3;
guns[METALBOW, BULLETOBJ] = objArrow;
guns[METALBOW, BULLETSPT] = sptArrow;
guns[METALBOW, BULLETSND] = sndRevolver;
guns[METALBOW, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[METALBOW, BULLETAMOUNT] = 1;
guns[METALBOW, BULLETANGLE] = [0];
guns[METALBOW, BULLETINDEX] = 1;
guns[METALBOW, RELOADINDEX] = 1;
guns[METALBOW, BEAM] = false;
guns[METALBOW, MELEE] = 0;
guns[METALBOW, CASINGS] = noone;
guns[METALBOW, CASINGFREQ] = -1;
#endregion Bolt Weapons

#region Bomb Weapons
guns[ROCKETLAUNCHER, GUNSPRITE] = sptRocketLauncher;
guns[ROCKETLAUNCHER, RELOADTIME] = 60;
guns[ROCKETLAUNCHER, RECOILSTART] = 0;
guns[ROCKETLAUNCHER, SHOTAMOUNT] = 1;
guns[ROCKETLAUNCHER, SHOTSPREAD] = 0;
guns[ROCKETLAUNCHER, SHOTSPEED] = 5;
guns[ROCKETLAUNCHER, SHOTBUFFER] = 60;
guns[ROCKETLAUNCHER, ATTACKPOINTS] = 2;
guns[ROCKETLAUNCHER, XORGIN] = -10;
guns[ROCKETLAUNCHER, YORGIN] = 3;
guns[ROCKETLAUNCHER, BULLETOBJ] = objRockets;
guns[ROCKETLAUNCHER, BULLETSPT] = sptRockets;
guns[ROCKETLAUNCHER, BULLETSND] = sndRevolver;
guns[ROCKETLAUNCHER, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[ROCKETLAUNCHER, BULLETAMOUNT] = 1;
guns[ROCKETLAUNCHER, BULLETANGLE] = [0];
guns[ROCKETLAUNCHER, BULLETINDEX] = 1;
guns[ROCKETLAUNCHER, RELOADINDEX] = 2;
guns[ROCKETLAUNCHER, BEAM] = false;
guns[ROCKETLAUNCHER, MELEE] = 0;
guns[ROCKETLAUNCHER, CASINGS] = noone;
guns[ROCKETLAUNCHER, CASINGFREQ] = -1;

guns[LARGEROCKETLAUNCHER, GUNSPRITE] = sptLargeRocketLauncher;
guns[LARGEROCKETLAUNCHER, RELOADTIME] = 60;
guns[LARGEROCKETLAUNCHER, RECOILSTART] = 0;
guns[LARGEROCKETLAUNCHER, SHOTAMOUNT] = 1;
guns[LARGEROCKETLAUNCHER, SHOTSPREAD] = 0;
guns[LARGEROCKETLAUNCHER, SHOTSPEED] = 5;
guns[LARGEROCKETLAUNCHER, SHOTBUFFER] = 60;
guns[LARGEROCKETLAUNCHER, ATTACKPOINTS] = 1;
guns[LARGEROCKETLAUNCHER, XORGIN] = -10;
guns[LARGEROCKETLAUNCHER, YORGIN] = 5;
guns[LARGEROCKETLAUNCHER, BULLETOBJ] = objRockets;
guns[LARGEROCKETLAUNCHER, BULLETSPT] = sptRockets;
guns[LARGEROCKETLAUNCHER, BULLETSND] = sndRevolver;
guns[LARGEROCKETLAUNCHER, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[LARGEROCKETLAUNCHER, BULLETAMOUNT] = 1;
guns[LARGEROCKETLAUNCHER, BULLETANGLE] = [0];
guns[LARGEROCKETLAUNCHER, BULLETINDEX] = 2;
guns[LARGEROCKETLAUNCHER, RELOADINDEX] = 2;
guns[LARGEROCKETLAUNCHER, BEAM] = false;
guns[LARGEROCKETLAUNCHER, MELEE] = 0;
guns[LARGEROCKETLAUNCHER, CASINGS] = noone;
guns[LARGEROCKETLAUNCHER, CASINGFREQ] = -1;

guns[GRENADELAUNCHER, GUNSPRITE] = sptGrenadeLauncher;
guns[GRENADELAUNCHER, RELOADTIME] = 60;
guns[GRENADELAUNCHER, RECOILSTART] = 0;
guns[GRENADELAUNCHER, SHOTAMOUNT] = 1;
guns[GRENADELAUNCHER, SHOTSPREAD] = 0;
guns[GRENADELAUNCHER, SHOTSPEED] = 4;
guns[GRENADELAUNCHER, SHOTBUFFER] = 60;
guns[GRENADELAUNCHER, ATTACKPOINTS] = 0;
guns[GRENADELAUNCHER, XORGIN] = -10;
guns[GRENADELAUNCHER, YORGIN] = 5;
guns[GRENADELAUNCHER, BULLETOBJ] = objLaunchedGrenade;
guns[GRENADELAUNCHER, BULLETSPT] = sptLaunchedGrenade;
guns[GRENADELAUNCHER, BULLETSND] = sndRevolver;
guns[GRENADELAUNCHER, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[GRENADELAUNCHER, BULLETAMOUNT] = 1;
guns[GRENADELAUNCHER, BULLETANGLE] = [0];
guns[GRENADELAUNCHER, BULLETINDEX] = 3;
guns[GRENADELAUNCHER, RELOADINDEX] = 1;
guns[GRENADELAUNCHER, BEAM] = false;
guns[GRENADELAUNCHER, MELEE] = 0;
guns[GRENADELAUNCHER, CASINGS] = noone;
guns[GRENADELAUNCHER, CASINGFREQ] = -1;

guns[AUTOGRENADELAUNCHER, GUNSPRITE] = sptAutoGrenadeLauncher;
guns[AUTOGRENADELAUNCHER, RELOADTIME] = 1;
guns[AUTOGRENADELAUNCHER, RECOILSTART] = 0;
guns[AUTOGRENADELAUNCHER, SHOTAMOUNT] = -1;
guns[AUTOGRENADELAUNCHER, SHOTSPREAD] = 0;
guns[AUTOGRENADELAUNCHER, SHOTSPEED] = 4;
guns[AUTOGRENADELAUNCHER, SHOTBUFFER] = 25;
guns[AUTOGRENADELAUNCHER, ATTACKPOINTS] = 0;
guns[AUTOGRENADELAUNCHER, XORGIN] = -10;
guns[AUTOGRENADELAUNCHER, YORGIN] = 5;
guns[AUTOGRENADELAUNCHER, BULLETOBJ] = objLaunchedGrenade;
guns[AUTOGRENADELAUNCHER, BULLETSPT] = sptLaunchedGrenade;
guns[AUTOGRENADELAUNCHER, BULLETSND] = sndRevolver;
guns[AUTOGRENADELAUNCHER, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[AUTOGRENADELAUNCHER, BULLETAMOUNT] = 1;
guns[AUTOGRENADELAUNCHER, BULLETANGLE] = [0];
guns[AUTOGRENADELAUNCHER, BULLETINDEX] = 3;
guns[AUTOGRENADELAUNCHER, RELOADINDEX] = 1;
guns[AUTOGRENADELAUNCHER, BEAM] = false;
guns[AUTOGRENADELAUNCHER, MELEE] = 0;
guns[AUTOGRENADELAUNCHER, CASINGS] = noone;
guns[AUTOGRENADELAUNCHER, CASINGFREQ] = -1;

guns[ROCKETBOW, GUNSPRITE] = sptRocketBow;
guns[ROCKETBOW, RELOADTIME] = 30;
guns[ROCKETBOW, RECOILSTART] = 0;
guns[ROCKETBOW, SHOTAMOUNT] = 1;
guns[ROCKETBOW, SHOTSPREAD] = 0;
guns[ROCKETBOW, SHOTSPEED] = 10;
guns[ROCKETBOW, SHOTBUFFER] = 30;
guns[ROCKETBOW, ATTACKPOINTS] = 3;
guns[ROCKETBOW, XORGIN] = -10;
guns[ROCKETBOW, YORGIN] = 3;
guns[ROCKETBOW, BULLETOBJ] = objRockets;
guns[ROCKETBOW, BULLETSPT] = sptRockets;
guns[ROCKETBOW, BULLETSND] = sndRevolver;
guns[ROCKETBOW, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[ROCKETBOW, BULLETAMOUNT] = 1;
guns[ROCKETBOW, BULLETANGLE] = [0];
guns[ROCKETBOW, BULLETINDEX] = 0;
guns[ROCKETBOW, RELOADINDEX] = 1;
guns[ROCKETBOW, BEAM] = false;
guns[ROCKETBOW, MELEE] = 0;
guns[ROCKETBOW, CASINGS] = noone;
guns[ROCKETBOW, CASINGFREQ] = -1;

guns[HANDGRENADE, GUNSPRITE] = sptHandGrenade;
guns[HANDGRENADE, RELOADTIME] = 60;
guns[HANDGRENADE, RECOILSTART] = 0;
guns[HANDGRENADE, SHOTAMOUNT] = 1;
guns[HANDGRENADE, SHOTSPREAD] = 0;
guns[HANDGRENADE, SHOTSPEED] = 4;
guns[HANDGRENADE, SHOTBUFFER] = 60;
guns[HANDGRENADE, ATTACKPOINTS] = 0;
guns[HANDGRENADE, XORGIN] = -10;
guns[HANDGRENADE, YORGIN] = 5;
guns[HANDGRENADE, BULLETOBJ] = objHandGrenade;
guns[HANDGRENADE, BULLETSPT] = sptHandGrenade;
guns[HANDGRENADE, BULLETSND] = sndRevolver;
guns[HANDGRENADE, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[HANDGRENADE, BULLETAMOUNT] = 1;
guns[HANDGRENADE, BULLETANGLE] = [0];
guns[HANDGRENADE, BULLETINDEX] = 3;
guns[HANDGRENADE, RELOADINDEX] = 2;
guns[HANDGRENADE, BEAM] = false;
guns[HANDGRENADE, MELEE] = 0;
guns[HANDGRENADE, CASINGS] = noone;
guns[HANDGRENADE, CASINGFREQ] = -1;

guns[BOMB, GUNSPRITE] = sptBomb;
guns[BOMB, RELOADTIME] = 60;
guns[BOMB, RECOILSTART] = 0;
guns[BOMB, SHOTAMOUNT] = 1;
guns[BOMB, SHOTSPREAD] = 0;
guns[BOMB, SHOTSPEED] = 4;
guns[BOMB, SHOTBUFFER] = 60;
guns[BOMB, ATTACKPOINTS] = 0;
guns[BOMB, XORGIN] = -10;
guns[BOMB, YORGIN] = 5;
guns[BOMB, BULLETOBJ] = objBomb;
guns[BOMB, BULLETSPT] = sptBomb;
guns[BOMB, BULLETSND] = sndRevolver;
guns[BOMB, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[BOMB, BULLETAMOUNT] = 1;
guns[BOMB, BULLETANGLE] = [0];
guns[BOMB, BULLETINDEX] = 2;
guns[BOMB, RELOADINDEX] = 10;
guns[BOMB, BEAM] = false;
guns[BOMB, MELEE] = 0;
guns[BOMB, CASINGS] = noone;
guns[BOMB, CASINGFREQ] = -1;
#endregion Bomb Weapons

#region Energy Weapons
guns[ENERGYREVOLVER, GUNSPRITE] = sptEnergyRevolver;
guns[ENERGYREVOLVER, RELOADTIME] = 10;
guns[ENERGYREVOLVER, RECOILSTART] = 0;
guns[ENERGYREVOLVER, SHOTAMOUNT] = 1;
guns[ENERGYREVOLVER, SHOTSPREAD] = 0;
guns[ENERGYREVOLVER, SHOTSPEED] = 3;
guns[ENERGYREVOLVER, SHOTBUFFER] = 30;
guns[ENERGYREVOLVER, ATTACKPOINTS] = 5;
guns[ENERGYREVOLVER, XORGIN] = -10;
guns[ENERGYREVOLVER, YORGIN] = 11;
guns[ENERGYREVOLVER, BULLETOBJ] = objEnergy;
guns[ENERGYREVOLVER, BULLETSPT] = sptEnergy;
guns[ENERGYREVOLVER, BULLETSND] = sndRevolver;
guns[ENERGYREVOLVER, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[ENERGYREVOLVER, BULLETAMOUNT] = 1;
guns[ENERGYREVOLVER, BULLETANGLE] = [0];
guns[ENERGYREVOLVER, BULLETINDEX] = 0;
guns[ENERGYREVOLVER, BULLETINDEX] = 0;
guns[ENERGYREVOLVER, RELOADINDEX] = 1;
guns[ENERGYREVOLVER, BEAM] = false;
guns[ENERGYREVOLVER, MELEE] = 0;
guns[ENERGYREVOLVER, CASINGS] = objEnergyCasings;
guns[ENERGYREVOLVER, CASINGFREQ] = 1;

guns[ENERGYSUBMACHINEGUN, GUNSPRITE] = sptEnergySubMachine;
guns[ENERGYSUBMACHINEGUN, RELOADTIME] = 30;
guns[ENERGYSUBMACHINEGUN, RECOILSTART] = 0;
guns[ENERGYSUBMACHINEGUN, SHOTAMOUNT] = 3;
guns[ENERGYSUBMACHINEGUN, SHOTSPREAD] = 10;
guns[ENERGYSUBMACHINEGUN, SHOTSPEED] = 3;
guns[ENERGYSUBMACHINEGUN, SHOTBUFFER] = 5;
guns[ENERGYSUBMACHINEGUN, ATTACKPOINTS] = 5;
guns[ENERGYSUBMACHINEGUN, XORGIN] = -13;
guns[ENERGYSUBMACHINEGUN, YORGIN] = 11;
guns[ENERGYSUBMACHINEGUN, BULLETOBJ] = objEnergy;
guns[ENERGYSUBMACHINEGUN, BULLETSPT] = sptEnergy;
guns[ENERGYSUBMACHINEGUN, BULLETSND] = sndRevolver;
guns[ENERGYSUBMACHINEGUN, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[ENERGYSUBMACHINEGUN, BULLETAMOUNT] = 1;
guns[ENERGYSUBMACHINEGUN, BULLETANGLE] = [0];
guns[ENERGYSUBMACHINEGUN, BULLETINDEX] = 0;
guns[ENERGYSUBMACHINEGUN, RELOADINDEX] = 1;
guns[ENERGYSUBMACHINEGUN, BEAM] = false;
guns[ENERGYSUBMACHINEGUN, MELEE] = 0;
guns[ENERGYSUBMACHINEGUN, CASINGS] = objEnergyCasings;
guns[ENERGYSUBMACHINEGUN, CASINGFREQ] = 1;

guns[ENERGYMACHINEGUN, GUNSPRITE] = sptEnergyMachineGun;
guns[ENERGYMACHINEGUN, RELOADTIME] = 1;
guns[ENERGYMACHINEGUN, RECOILSTART] = 0;
guns[ENERGYMACHINEGUN, SHOTAMOUNT] = -1;
guns[ENERGYMACHINEGUN, SHOTSPREAD] = 10;
guns[ENERGYMACHINEGUN, SHOTSPEED] = 4;
guns[ENERGYMACHINEGUN, SHOTBUFFER] = 5;
guns[ENERGYMACHINEGUN, ATTACKPOINTS] = 4;
guns[ENERGYMACHINEGUN, XORGIN] = -20;
guns[ENERGYMACHINEGUN, YORGIN] = 11;
guns[ENERGYMACHINEGUN, BULLETOBJ] = objEnergy;
guns[ENERGYMACHINEGUN, BULLETSPT] = sptEnergy;
guns[ENERGYMACHINEGUN, BULLETSND] = sndRevolver;
guns[ENERGYMACHINEGUN, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[ENERGYMACHINEGUN, BULLETAMOUNT] = 1;
guns[ENERGYMACHINEGUN, BULLETANGLE] = [0];
guns[ENERGYMACHINEGUN, BULLETINDEX] = 0;
guns[ENERGYMACHINEGUN, RELOADINDEX] = 1;
guns[ENERGYMACHINEGUN, BEAM] = false;
guns[ENERGYMACHINEGUN, MELEE] = 0;
guns[ENERGYMACHINEGUN, CASINGS] = objEnergyCasings;
guns[ENERGYMACHINEGUN, CASINGFREQ] = 3;

guns[ENERGYASSAULTRIFFLE, GUNSPRITE] = sptEnergyAssault;
guns[ENERGYASSAULTRIFFLE, RELOADTIME] = 1;
guns[ENERGYASSAULTRIFFLE, RECOILSTART] = 0;
guns[ENERGYASSAULTRIFFLE, SHOTAMOUNT] = -1;
guns[ENERGYASSAULTRIFFLE, SHOTSPREAD] = 0;
guns[ENERGYASSAULTRIFFLE, SHOTSPEED] = 0;
guns[ENERGYASSAULTRIFFLE, SHOTBUFFER] = 0;
guns[ENERGYASSAULTRIFFLE, ATTACKPOINTS] = 3;
guns[ENERGYASSAULTRIFFLE, XORGIN] = -25;
guns[ENERGYASSAULTRIFFLE, YORGIN] = 9;
guns[ENERGYASSAULTRIFFLE, BULLETOBJ] = objEnergyBeam;
guns[ENERGYASSAULTRIFFLE, BULLETSPT] = sptEnergyBeamStart;
guns[ENERGYASSAULTRIFFLE, BULLETSND] = sndRevolver;
guns[ENERGYASSAULTRIFFLE, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[ENERGYASSAULTRIFFLE, BULLETAMOUNT] = 1;
guns[ENERGYASSAULTRIFFLE, BULLETANGLE] =[0];
guns[ENERGYASSAULTRIFFLE, BULLETINDEX] = 0;
guns[ENERGYASSAULTRIFFLE, RELOADINDEX] = 1;
guns[ENERGYASSAULTRIFFLE, BEAM] = true;
guns[ENERGYASSAULTRIFFLE, MELEE] = 0;
guns[ENERGYASSAULTRIFFLE, CASINGS] = objEnergyCasings;
guns[ENERGYASSAULTRIFFLE, CASINGFREQ] = 3;

guns[ENERGYKATANA, GUNSPRITE] = sptEnergyKatana;
guns[ENERGYKATANA, RELOADTIME] = 30;
guns[ENERGYKATANA, RECOILSTART] = 0;
guns[ENERGYKATANA, SHOTAMOUNT] = 1;
guns[ENERGYKATANA, SHOTSPREAD] = 0;
guns[ENERGYKATANA, SHOTSPEED] = 0;
guns[ENERGYKATANA, SHOTBUFFER] = 30;
guns[ENERGYKATANA, ATTACKPOINTS] = 5;
guns[ENERGYKATANA, XORGIN] = -10;
guns[ENERGYKATANA, YORGIN] = 20;
guns[ENERGYKATANA, BULLETOBJ] = objEnergy_Melee;
guns[ENERGYKATANA, BULLETSPT] = sptEnergy_Melee;
guns[ENERGYKATANA, BULLETSND] = sndRevolver;
guns[ENERGYKATANA, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[ENERGYKATANA, BULLETAMOUNT] = 1;
guns[ENERGYKATANA, BULLETANGLE] =[0];
guns[ENERGYKATANA, BULLETINDEX] = 0;
guns[ENERGYKATANA, RELOADINDEX] = 1;
guns[ENERGYKATANA, BEAM] = false;
guns[ENERGYKATANA, MELEE] = 120;
guns[ENERGYKATANA, CASINGS] = noone;
guns[ENERGYKATANA, CASINGFREQ] = -1;
#endregion Energy Weapons

#region Fire Weapons
guns[FLAMETHROWER, GUNSPRITE] = sptFlamethrower;
guns[FLAMETHROWER, RELOADTIME] = 1;
guns[FLAMETHROWER, RECOILSTART] = 0;
guns[FLAMETHROWER, SHOTAMOUNT] = -1;
guns[FLAMETHROWER, SHOTSPREAD] = 0;
guns[FLAMETHROWER, SHOTSPEED] = 0;
guns[FLAMETHROWER, SHOTBUFFER] = 0;
guns[FLAMETHROWER, ATTACKPOINTS] = 4;
guns[FLAMETHROWER, XORGIN] = -24;
guns[FLAMETHROWER, YORGIN] = 11;
guns[FLAMETHROWER, BULLETOBJ] = objFlame;
guns[FLAMETHROWER, BULLETSPT] = sptFlame;
guns[FLAMETHROWER, BULLETSND] = sndRevolver;
guns[FLAMETHROWER, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[FLAMETHROWER, BULLETAMOUNT] = 1;
guns[FLAMETHROWER, BULLETANGLE] = [0];
guns[FLAMETHROWER, BULLETINDEX] = 0;
guns[FLAMETHROWER, BULLETINDEX] = 0;
guns[FLAMETHROWER, RELOADINDEX] = 1;
guns[FLAMETHROWER, BEAM] = true;
guns[FLAMETHROWER, MELEE] = 0;
guns[FLAMETHROWER, CASINGS] = noone;
guns[FLAMETHROWER, CASINGFREQ] = -1;

guns[FIRECANON, GUNSPRITE] = sptFireCanon;
guns[FIRECANON, RELOADTIME] = 20;
guns[FIRECANON, RECOILSTART] = 0;
guns[FIRECANON, SHOTAMOUNT] = 1;
guns[FIRECANON, SHOTSPREAD] = 0;
guns[FIRECANON, SHOTSPEED] = 5;
guns[FIRECANON, SHOTBUFFER] = 20;
guns[FIRECANON, ATTACKPOINTS] = 5;
guns[FIRECANON, XORGIN] = -10;
guns[FIRECANON, YORGIN] = 10;
guns[FIRECANON, BULLETOBJ] = objFireBall;
guns[FIRECANON, BULLETSPT] = sptFireBall;
guns[FIRECANON, BULLETSND] = sndRevolver;
guns[FIRECANON, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[FIRECANON, BULLETAMOUNT] = 1;
guns[FIRECANON, BULLETANGLE] = [0];
guns[FIRECANON, BULLETINDEX] = 0;
guns[FIRECANON, BULLETINDEX] = 0;
guns[FIRECANON, RELOADINDEX] = 1;
guns[FIRECANON, BEAM] = false;
guns[FIRECANON, MELEE] = 0;
guns[FIRECANON, CASINGS] = noone;
guns[FIRECANON, CASINGFREQ] = -1;

guns[TRIPPLEFIRECANON, GUNSPRITE] = sptTripleFireCanon;
guns[TRIPPLEFIRECANON, RELOADTIME] = 1;
guns[TRIPPLEFIRECANON, RECOILSTART] = 0;
guns[TRIPPLEFIRECANON, SHOTAMOUNT] = -1;
guns[TRIPPLEFIRECANON, SHOTSPREAD] = 1;
guns[TRIPPLEFIRECANON, SHOTSPEED] = 5;
guns[TRIPPLEFIRECANON, SHOTBUFFER] = 10;
guns[TRIPPLEFIRECANON, ATTACKPOINTS] = 5;
guns[TRIPPLEFIRECANON, XORGIN] = -16;
guns[TRIPPLEFIRECANON, YORGIN] = 10;
guns[TRIPPLEFIRECANON, BULLETOBJ] = objFireBall;
guns[TRIPPLEFIRECANON, BULLETSPT] = sptFireBall;
guns[TRIPPLEFIRECANON, BULLETSND] = sndRevolver;
guns[TRIPPLEFIRECANON, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[TRIPPLEFIRECANON, BULLETAMOUNT] = 3;
guns[TRIPPLEFIRECANON, BULLETANGLE] = [-8,0,8];
guns[TRIPPLEFIRECANON, BULLETINDEX] = 0;
guns[TRIPPLEFIRECANON, RELOADINDEX] = 1;
guns[TRIPPLEFIRECANON, BEAM] = false;
guns[TRIPPLEFIRECANON, MELEE] = 0;
guns[TRIPPLEFIRECANON, CASINGS] = noone;
guns[TRIPPLEFIRECANON, CASINGFREQ] = -1;

guns[FIRELOBBER, GUNSPRITE] = sptFireLobber;
guns[FIRELOBBER, RELOADTIME] = 20;
guns[FIRELOBBER, RECOILSTART] = 0;
guns[FIRELOBBER, SHOTAMOUNT] = 1;
guns[FIRELOBBER, SHOTSPREAD] = 0;
guns[FIRELOBBER, SHOTSPEED] = 5;
guns[FIRELOBBER, SHOTBUFFER] = 20;
guns[FIRELOBBER, ATTACKPOINTS] = 5;
guns[FIRELOBBER, XORGIN] = -10;
guns[FIRELOBBER, YORGIN] = 10;
guns[FIRELOBBER, BULLETOBJ] = objFireLob;
guns[FIRELOBBER, BULLETSPT] = sptFireBall;
guns[FIRELOBBER, BULLETSND] = sndRevolver;
guns[FIRELOBBER, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[FIRELOBBER, BULLETAMOUNT] = 1;
guns[FIRELOBBER, BULLETANGLE] = [0];
guns[FIRELOBBER, BULLETINDEX] = 0;
guns[FIRELOBBER, BULLETINDEX] = 0;
guns[FIRELOBBER, RELOADINDEX] = 1;
guns[FIRELOBBER, BEAM] = false;
guns[FIRELOBBER, MELEE] = 0;
guns[FIRELOBBER, CASINGS] = noone;
guns[FIRELOBBER, CASINGFREQ] = -1;

guns[FIREBOW, GUNSPRITE] = sptFireBow;
guns[FIREBOW, RELOADTIME] = 30;
guns[FIREBOW, RECOILSTART] = 0;
guns[FIREBOW, SHOTAMOUNT] = 1;
guns[FIREBOW, SHOTSPREAD] = 0;
guns[FIREBOW, SHOTSPEED] = 10;
guns[FIREBOW, SHOTBUFFER] = 30;
guns[FIREBOW, ATTACKPOINTS] = 8;
guns[FIREBOW, XORGIN] = -10;
guns[FIREBOW, YORGIN] = 3;
guns[FIREBOW, BULLETOBJ] = objFireArrow;
guns[FIREBOW, BULLETSPT] = sptFireArrow;
guns[FIREBOW, BULLETSND] = sndRevolver;
guns[FIREBOW, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[FIREBOW, BULLETAMOUNT] = 1;
guns[FIREBOW, BULLETANGLE] = [0];
guns[FIREBOW, BULLETINDEX] = 0;
guns[FIREBOW, RELOADINDEX] = 1;
guns[FIREBOW, BEAM] = false;
guns[FIREBOW, MELEE] = 0;
guns[FIREBOW, CASINGS] = noone;
guns[FIREBOW, CASINGFREQ] = -1;

guns[FIRESWORD, GUNSPRITE] = sptFireSword;
guns[FIRESWORD, RELOADTIME] = 30;
guns[FIRESWORD, RECOILSTART] = 0;
guns[FIRESWORD, SHOTAMOUNT] = 1;
guns[FIRESWORD, SHOTSPREAD] = 0;
guns[FIRESWORD, SHOTSPEED] = 0;
guns[FIRESWORD, SHOTBUFFER] = 30;
guns[FIRESWORD, ATTACKPOINTS] = 4;
guns[FIRESWORD, XORGIN] = -10;
guns[FIRESWORD, YORGIN] = 20;
guns[FIRESWORD, BULLETOBJ] = objFire_Melee;
guns[FIRESWORD, BULLETSPT] = sptFire_Melee;
guns[FIRESWORD, BULLETSND] = sndRevolver;
guns[FIRESWORD, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[FIRESWORD, BULLETAMOUNT] = 1;
guns[FIRESWORD, BULLETANGLE] =[0];
guns[FIRESWORD, BULLETINDEX] = 0;
guns[FIRESWORD, RELOADINDEX] = 1;
guns[FIRESWORD, BEAM] = false;
guns[FIRESWORD, MELEE] = 90;
guns[FIRESWORD, CASINGS] = noone;
guns[FIRESWORD, CASINGFREQ] = -1;
#endregion Fire Weapons

#region Melee Weapons
guns[KNIFE, GUNSPRITE] = sptKnife;
guns[KNIFE, RELOADTIME] = 10;
guns[KNIFE, RECOILSTART] = 0;
guns[KNIFE, SHOTAMOUNT] = 1;
guns[KNIFE, SHOTSPREAD] = 0;
guns[KNIFE, SHOTSPEED] = 0;
guns[KNIFE, SHOTBUFFER] = 10;
guns[KNIFE, ATTACKPOINTS] = 2;
guns[KNIFE, XORGIN] = -10;
guns[KNIFE, YORGIN] = 20;
guns[KNIFE, BULLETOBJ] = objKnife_Melee;
guns[KNIFE, BULLETSPT] = sptKnife_Melee;
guns[KNIFE, BULLETSND] = sndRevolver;
guns[KNIFE, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[KNIFE, BULLETAMOUNT] = 1;
guns[KNIFE, BULLETANGLE] =[0];
guns[KNIFE, BULLETINDEX] = 0;
guns[KNIFE, RELOADINDEX] = 1;
guns[KNIFE, BEAM] = false;
guns[KNIFE, MELEE] = 50;
guns[KNIFE, CASINGS] = noone;
guns[KNIFE, CASINGFREQ] = -1;

guns[SWORD, GUNSPRITE] = sptSword;
guns[SWORD, RELOADTIME] = 30;
guns[SWORD, RECOILSTART] = 0;
guns[SWORD, SHOTAMOUNT] = 1;
guns[SWORD, SHOTSPREAD] = 0;
guns[SWORD, SHOTSPEED] = 0;
guns[SWORD, SHOTBUFFER] = 30;
guns[SWORD, ATTACKPOINTS] = 4;
guns[SWORD, XORGIN] = -20;
guns[SWORD, YORGIN] = 20;
guns[SWORD, BULLETOBJ] = objSword_Melee;
guns[SWORD, BULLETSPT] = sptSword_Melee;
guns[SWORD, BULLETSND] = sndRevolver;
guns[SWORD, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[SWORD, BULLETAMOUNT] = 1;
guns[SWORD, BULLETANGLE] =[0];
guns[SWORD, BULLETINDEX] = 0;
guns[SWORD, RELOADINDEX] = 1;
guns[SWORD, BEAM] = false;
guns[SWORD, MELEE] = 90;
guns[SWORD, CASINGS] = noone;
guns[SWORD, CASINGFREQ] = -1;

guns[KATANA, GUNSPRITE] = sptKatana;
guns[KATANA, RELOADTIME] = 60;
guns[KATANA, RECOILSTART] = 0;
guns[KATANA, SHOTAMOUNT] = 1;
guns[KATANA, SHOTSPREAD] = 0;
guns[KATANA, SHOTSPEED] = 0;
guns[KATANA, SHOTBUFFER] = 60;
guns[KATANA, ATTACKPOINTS] = 6;
guns[KATANA, XORGIN] = -10;
guns[KATANA, YORGIN] = 20;
guns[KATANA, BULLETOBJ] = objKatana_Melee;
guns[KATANA, BULLETSPT] = sptKatana_Melee;
guns[KATANA, BULLETSND] = sndRevolver;
guns[KATANA, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[KATANA, BULLETAMOUNT] = 1;
guns[KATANA, BULLETANGLE] =[0];
guns[KATANA, BULLETINDEX] = 0;
guns[KATANA, RELOADINDEX] = 1;
guns[KATANA, BEAM] = false;
guns[KATANA, MELEE] = 120;
guns[KATANA, CASINGS] = noone;
guns[KATANA, CASINGFREQ] = -1;

guns[CLUB, GUNSPRITE] = sptClub;
guns[CLUB, RELOADTIME] = 40;
guns[CLUB, RECOILSTART] = 0;
guns[CLUB, SHOTAMOUNT] = 1;
guns[CLUB, SHOTSPREAD] = 0;
guns[CLUB, SHOTSPEED] = 0;
guns[CLUB, SHOTBUFFER] = 40;
guns[CLUB, ATTACKPOINTS] = 5;
guns[CLUB, XORGIN] = -20;
guns[CLUB, YORGIN] = 20;
guns[CLUB, BULLETOBJ] = objClub_Melee;
guns[CLUB, BULLETSPT] = sptClub_Melee;
guns[CLUB, BULLETSND] = sndRevolver;
guns[CLUB, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[CLUB, BULLETAMOUNT] = 1;
guns[CLUB, BULLETANGLE] =[0];
guns[CLUB, BULLETINDEX] = 0;
guns[CLUB, RELOADINDEX] = 1;
guns[CLUB, BEAM] = false;
guns[CLUB, MELEE] = 90;
guns[CLUB, CASINGS] = noone;
guns[CLUB, CASINGFREQ] = -1;

guns[MALLET, GUNSPRITE] = sptMallet;
guns[MALLET, RELOADTIME] = 60;
guns[MALLET, RECOILSTART] = 0;
guns[MALLET, SHOTAMOUNT] = 1;
guns[MALLET, SHOTSPREAD] = 0;
guns[MALLET, SHOTSPEED] = 0;
guns[MALLET, SHOTBUFFER] = 60;
guns[MALLET, ATTACKPOINTS] = 7;
guns[MALLET, XORGIN] = -30;
guns[MALLET, YORGIN] = 20;
guns[MALLET, BULLETOBJ] = objMallet_Melee;
guns[MALLET, BULLETSPT] = sptMallet_Melee;
guns[MALLET, BULLETSND] = sndRevolver;
guns[MALLET, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[MALLET, BULLETAMOUNT] = 1;
guns[MALLET, BULLETANGLE] =[0];
guns[MALLET, BULLETINDEX] = 0;
guns[MALLET, RELOADINDEX] = 1;
guns[MALLET, BEAM] = false;
guns[MALLET, MELEE] = 120;
guns[MALLET, CASINGS] = noone;
guns[MALLET, CASINGFREQ] = -1;
#endregion Melee Weapons

#region Rock Weapons
guns[SLINGSHOT, GUNSPRITE] = sptSlingShot;
guns[SLINGSHOT, RELOADTIME] = 20;
guns[SLINGSHOT, RECOILSTART] = 0;
guns[SLINGSHOT, SHOTAMOUNT] = 1;
guns[SLINGSHOT, SHOTSPREAD] = 0;
guns[SLINGSHOT, SHOTSPEED] = 4;
guns[SLINGSHOT, SHOTBUFFER] = 20;
guns[SLINGSHOT, ATTACKPOINTS] = 2;
guns[SLINGSHOT, XORGIN] = -10;
guns[SLINGSHOT, YORGIN] = 5;
guns[SLINGSHOT, BULLETOBJ] = objRock;
guns[SLINGSHOT, BULLETSPT] = sptRock;
guns[SLINGSHOT, BULLETSND] = sndRevolver;
guns[SLINGSHOT, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[SLINGSHOT, BULLETAMOUNT] = 1;
guns[SLINGSHOT, BULLETANGLE] = [0];
guns[SLINGSHOT, BULLETINDEX] = 3;
guns[SLINGSHOT, RELOADINDEX] = 2;
guns[SLINGSHOT, BEAM] = false;
guns[SLINGSHOT, MELEE] = 0;
guns[SLINGSHOT, CASINGS] = noone;
guns[SLINGSHOT, CASINGFREQ] = -1;

guns[CATAPULT, GUNSPRITE] = sptCatapult;
guns[CATAPULT, RELOADTIME] = 20;
guns[CATAPULT, RECOILSTART] = 0;
guns[CATAPULT, SHOTAMOUNT] = 1;
guns[CATAPULT, SHOTSPREAD] = 0;
guns[CATAPULT, SHOTSPEED] = 3;
guns[CATAPULT, SHOTBUFFER] = 20;
guns[CATAPULT, ATTACKPOINTS] = 4;
guns[CATAPULT, XORGIN] = -15;
guns[CATAPULT, YORGIN] = 5;
guns[CATAPULT, BULLETOBJ] = objRock;
guns[CATAPULT, BULLETSPT] = sptRock;
guns[CATAPULT, BULLETSND] = sndRevolver;
guns[CATAPULT, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[CATAPULT, BULLETAMOUNT] = 1;
guns[CATAPULT, BULLETANGLE] = [0];
guns[CATAPULT, BULLETINDEX] = 3;
guns[CATAPULT, RELOADINDEX] = 2;
guns[CATAPULT, BEAM] = false;
guns[CATAPULT, MELEE] = 0;
guns[CATAPULT, CASINGS] = noone;
guns[CATAPULT, CASINGFREQ] = -1;

guns[ROCKRAIL, GUNSPRITE] = sptRockRail;
guns[ROCKRAIL, RELOADTIME] = 20;
guns[ROCKRAIL, RECOILSTART] = 0;
guns[ROCKRAIL, SHOTAMOUNT] = 1;
guns[ROCKRAIL, SHOTSPREAD] = 0;
guns[ROCKRAIL, SHOTSPEED] = 10;
guns[ROCKRAIL, SHOTBUFFER] = 20;
guns[ROCKRAIL, ATTACKPOINTS] = 5;
guns[ROCKRAIL, XORGIN] = -10;
guns[ROCKRAIL, YORGIN] = 5;
guns[ROCKRAIL, BULLETOBJ] = objRock;
guns[ROCKRAIL, BULLETSPT] = sptRock;
guns[ROCKRAIL, BULLETSND] = sndRevolver;
guns[ROCKRAIL, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[ROCKRAIL, BULLETAMOUNT] = 1;
guns[ROCKRAIL, BULLETANGLE] = [0];
guns[ROCKRAIL, BULLETINDEX] = 3;
guns[ROCKRAIL, RELOADINDEX] = 1;
guns[ROCKRAIL, BEAM] = false;
guns[ROCKRAIL, MELEE] = 0;
guns[ROCKRAIL, CASINGS] = noone;
guns[ROCKRAIL, CASINGFREQ] = -1;
#endregion Rock Weapons

#region Shell Weapons
guns[SHOTGUN, GUNSPRITE] = sptShotgun;
guns[SHOTGUN, RELOADTIME] = 30;
guns[SHOTGUN, RECOILSTART] = 0;
guns[SHOTGUN, SHOTAMOUNT] = 1;
guns[SHOTGUN, SHOTSPREAD] = 4;
guns[SHOTGUN, SHOTSPEED] = 10;
guns[SHOTGUN, SHOTBUFFER] = 30;
guns[SHOTGUN, ATTACKPOINTS] = 3;
guns[SHOTGUN, XORGIN] = -20;
guns[SHOTGUN, YORGIN] = 11;
guns[SHOTGUN, BULLETOBJ] = objShell;
guns[SHOTGUN, BULLETSPT] = sptShell;
guns[SHOTGUN, BULLETSND] = sndRevolver;
guns[SHOTGUN, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[SHOTGUN, BULLETAMOUNT] = 1;
guns[SHOTGUN, BULLETANGLE] = [0];
guns[SHOTGUN, BULLETINDEX] = 0;
guns[SHOTGUN, RELOADINDEX] = 1;
guns[SHOTGUN, BEAM] = false;
guns[SHOTGUN, MELEE] = 0;
guns[SHOTGUN, CASINGS] = objShellCasings;
guns[SHOTGUN, CASINGFREQ] = 1;

guns[SAWEDOFF, GUNSPRITE] = sptSawedOff;
guns[SAWEDOFF, RELOADTIME] = 30;
guns[SAWEDOFF, RECOILSTART] = 0;
guns[SAWEDOFF, SHOTAMOUNT] = 1;
guns[SAWEDOFF, SHOTSPREAD] = 4;
guns[SAWEDOFF, SHOTSPEED] = 10;
guns[SAWEDOFF, SHOTBUFFER] = 30;
guns[SAWEDOFF, ATTACKPOINTS] = 6;
guns[SAWEDOFF, XORGIN] = -20;
guns[SAWEDOFF, YORGIN] = 11;
guns[SAWEDOFF, BULLETOBJ] = objShell;
guns[SAWEDOFF, BULLETSPT] = sptShell;
guns[SAWEDOFF, BULLETSND] = sndRevolver;
guns[SAWEDOFF, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[SAWEDOFF, BULLETAMOUNT] = 1;
guns[SAWEDOFF, BULLETANGLE] = [0];
guns[SAWEDOFF, BULLETINDEX] = 0;
guns[SAWEDOFF, RELOADINDEX] = 1;
guns[SAWEDOFF, BEAM] = false;
guns[SAWEDOFF, MELEE] = 0;
guns[SAWEDOFF, CASINGS] = objShellCasings;
guns[SAWEDOFF, CASINGFREQ] = 1;

guns[DUELSHOTGUN, GUNSPRITE] = sptDuelShotgun;
guns[DUELSHOTGUN, RELOADTIME] = 30;
guns[DUELSHOTGUN, RECOILSTART] = 0;
guns[DUELSHOTGUN, SHOTAMOUNT] = 1;
guns[DUELSHOTGUN, SHOTSPREAD] = 3;
guns[DUELSHOTGUN, SHOTSPEED] = 10;
guns[DUELSHOTGUN, SHOTBUFFER] = 30;
guns[DUELSHOTGUN, ATTACKPOINTS] = 3;
guns[DUELSHOTGUN, XORGIN] = -20;
guns[DUELSHOTGUN, YORGIN] = 11;
guns[DUELSHOTGUN, BULLETOBJ] = objShell;
guns[DUELSHOTGUN, BULLETSPT] = sptShell;
guns[DUELSHOTGUN, BULLETSND] = sndRevolver;
guns[DUELSHOTGUN, BULLETSHAKE] = [1,6,0.2,0.2,7];
guns[DUELSHOTGUN, BULLETAMOUNT] = 2;
guns[DUELSHOTGUN, BULLETANGLE] = [-4,4];
guns[DUELSHOTGUN, BULLETINDEX] = 0;
guns[DUELSHOTGUN, RELOADINDEX] = 1;
guns[DUELSHOTGUN, BEAM] = false;
guns[DUELSHOTGUN, MELEE] = 0;
guns[DUELSHOTGUN, CASINGS] = noone;
guns[DUELSHOTGUN, CASINGFREQ] = -1;

guns[AUTOSHOTGUN, GUNSPRITE] = sptAutoShotgun;
guns[AUTOSHOTGUN, RELOADTIME] = 10;
guns[AUTOSHOTGUN, RECOILSTART] = 0;
guns[AUTOSHOTGUN, SHOTAMOUNT] = -1;
guns[AUTOSHOTGUN, SHOTSPREAD] = 4;
guns[AUTOSHOTGUN, SHOTSPEED] = 10;
guns[AUTOSHOTGUN, SHOTBUFFER] = 10;
guns[AUTOSHOTGUN, ATTACKPOINTS] = 3;
guns[AUTOSHOTGUN, XORGIN] = -20;
guns[AUTOSHOTGUN, YORGIN] = 11;
guns[AUTOSHOTGUN, BULLETOBJ] = objShell;
guns[AUTOSHOTGUN, BULLETSPT] = sptShell;
guns[AUTOSHOTGUN, BULLETSND] = sndRevolver;
guns[AUTOSHOTGUN, BULLETSHAKE] = [2,7,0.2,0.2,10];
guns[AUTOSHOTGUN, BULLETAMOUNT] = 1;
guns[AUTOSHOTGUN, BULLETANGLE] = [0];
guns[AUTOSHOTGUN, BULLETINDEX] = 0;
guns[AUTOSHOTGUN, RELOADINDEX] = 1;
guns[AUTOSHOTGUN, BEAM] = false;
guns[AUTOSHOTGUN, MELEE] = 0;
guns[AUTOSHOTGUN, CASINGS] = objShellCasings;
guns[AUTOSHOTGUN, CASINGFREQ] = 1;
#endregion Shell Weapons

instance_create_layer(x, y, "Todd", objCamera);

set_weapon(REVOLVER);
curwep = 0;