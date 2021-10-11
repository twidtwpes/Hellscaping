//Gun Macros
#macro REVOLVER 0
#macro MACHINEGUN 1
#macro SUBMACHINEGUN 2
#macro ASSAULTRIFFLE 3
#macro KNIFE 4
#macro SWORD 5
#macro KATANA 6
#macro CLUB 7
#macro MALLET 8

#macro GUNSPRITE 0
#macro RELOADTIME 1
#macro RECOILSTART 2
#macro SHOTAMOUNT 3
#macro SHOTSPREAD 4
#macro SHOTSPEED 5
#macro SHOTTIMETODIE 6
#macro ATTACKPOINTS 7

// Movement vars
hit_dir = 0;
hit_spd = 0;
hit_amt = 0;
hit_now = false;
x_speed_ = 0;
y_speed_ = 0;
max_speed_ = 2;
acceleration_ = .5;
recovery_remain = 0;
flash = 0;
water = 0;
footprints = 0;

// Controller vars
controller = 0;
hascontrol = true;
gunangle = 0;
firing = false;
currentshot = -1;
currentreload = 0;
currentrecoil = 0;

// Gun vars
currentGun = 0;
gunsprite = 0;
reloadtime = 0;
recoilstart = 0;
shotamount = 0;
shotspread = 0;
shotspeed = 0;
shottimetodie = 0;

guns[REVOLVER, GUNSPRITE] = sptRevolver;
guns[REVOLVER, RELOADTIME] = 10;
guns[REVOLVER, RECOILSTART] = 0;
guns[REVOLVER, SHOTAMOUNT] = 1;
guns[REVOLVER, SHOTSPREAD] = 0;
guns[REVOLVER, SHOTSPEED] = 10;
guns[REVOLVER, SHOTTIMETODIE] = 100;
guns[REVOLVER, ATTACKPOINTS] = 2;
guns[MACHINEGUN, GUNSPRITE] = sptMachineGun;
guns[MACHINEGUN, RELOADTIME] = 10;
guns[MACHINEGUN, RECOILSTART] = 0;
guns[MACHINEGUN, SHOTAMOUNT] = 1;
guns[MACHINEGUN, SHOTSPREAD] = 0;
guns[MACHINEGUN, SHOTSPEED] = 10;
guns[MACHINEGUN, SHOTTIMETODIE] = 100;
guns[MACHINEGUN, ATTACKPOINTS] = 1;
#region otherguns
//guns[MACHINEGUN, RECOILSTART] = 0;
//guns[MACHINEGUN, FIRINGDELAYSTART] = 20;
//guns[MACHINEGUN, YOFFSET] = -5;
//guns[MACHINEGUN, XOFFSET] = -5;
//guns[MACHINEGUN, BOFFSET] = 1;
//guns[MACHINEGUN, BANGLEOFFSET] = 1;
//guns[MACHINEGUN, SPREAD] = 3;
//guns[MACHINEGUN, BSPEED] = 10;
//guns[SUBMACHINEGUN, RECOILSTART] = 4;
//guns[SUBMACHINEGUN, FIRINGDELAYSTART] = 5;
//guns[SUBMACHINEGUN, YOFFSET] = 14;
//guns[SUBMACHINEGUN, XOFFSET] = 28;
//guns[SUBMACHINEGUN, BOFFSET] = 1;
//guns[SUBMACHINEGUN, BANGLEOFFSET] = 1;
//guns[SUBMACHINEGUN, SPREAD] = 3;
//guns[SUBMACHINEGUN, BSPEED] = 25;
//guns[ASSAULTRIFFLE, RECOILSTART] = 4;
//guns[ASSAULTRIFFLE, FIRINGDELAYSTART] = 5;
//guns[ASSAULTRIFFLE, YOFFSET] = 14;
//guns[ASSAULTRIFFLE, XOFFSET] = 28;
//guns[ASSAULTRIFFLE, BOFFSET] = 1;
//guns[ASSAULTRIFFLE, BANGLEOFFSET] = 1;
//guns[ASSAULTRIFFLE, SPREAD] = 3;
//guns[ASSAULTRIFFLE, BSPEED] = 25;
//guns[KNIFE, RECOILSTART] = 4;
//guns[KNIFE, FIRINGDELAYSTART] = 5;
//guns[KNIFE, YOFFSET] = 14;
//guns[KNIFE, XOFFSET] = 28;
//guns[KNIFE, BOFFSET] = 1;
//guns[KNIFE, BANGLEOFFSET] = 1;
//guns[KNIFE, SPREAD] = 3;
//guns[KNIFE, BSPEED] = 25;
//guns[SWORD, RECOILSTART] = 4;
//guns[SWORD, FIRINGDELAYSTART] = 5;
//guns[SWORD, YOFFSET] = 14;
//guns[SWORD, XOFFSET] = 28;
//guns[SWORD, BOFFSET] = 1;
//guns[SWORD, BANGLEOFFSET] = 1;
//guns[SWORD, SPREAD] = 3;
//guns[SWORD, BSPEED] = 25;
//guns[KATANA, RECOILSTART] = 4;
//guns[KATANA, FIRINGDELAYSTART] = 5;
//guns[KATANA, YOFFSET] = 14;
//guns[KATANA, XOFFSET] = 28;
//guns[KATANA, BOFFSET] = 1;
//guns[KATANA, BANGLEOFFSET] = 1;
//guns[KATANA, SPREAD] = 3;
//guns[KATANA, BSPEED] = 25;
//guns[CLUB, RECOILSTART] = 4;
//guns[CLUB, FIRINGDELAYSTART] = 5;
//guns[CLUB, YOFFSET] = 14;
//guns[CLUB, XOFFSET] = 28;
//guns[CLUB, BOFFSET] = 1;
//guns[CLUB, BANGLEOFFSET] = 1;
//guns[CLUB, SPREAD] = 3;
//guns[CLUB, BSPEED] = 25;
//guns[MALLET, RECOILSTART] = 4;
//guns[MALLET, FIRINGDELAYSTART] = 5;
//guns[MALLET, YOFFSET] = 14;
//guns[MALLET, XOFFSET] = 28;
//guns[MALLET, BOFFSET] = 1;
//guns[MALLET, BANGLEOFFSET] = 1;
//guns[MALLET, SPREAD] = 3;
//guns[MALLET, BSPEED] = 25;
#endregion otherguns

instance_create_layer(x, y, "Todd", objCamera);

