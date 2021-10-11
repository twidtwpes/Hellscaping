title_menu = 0;
pause = false;
level_load = noone

level = 1;
stage = 1;
kills = 0;

bullets_ammo = 0;
shells_ammo = 0;
energy_ammo = 0;
bolts_ammo = 0;
fuel_ammo = 0;
rocks_ammo = 0;
bombs_ammo = 0;

settings = ds_map_create();
ds_map_add(settings, "fullscreen", false);
ds_map_add(settings, "mute", true);
ds_map_add(settings, "audio_level", 9);
ds_map_add(settings, "controls", 0);

stats = ds_map_create();
ds_map_add(stats, "lifetime_kills", 0);
ds_map_add(stats, "lifetime_hours", 0);
ds_map_add(stats, "session_kills", 0);
ds_map_add(stats, "session_hours", 0);
ds_map_add(stats, "furthest_complete", 0);
ds_map_add(stats, "session_complete", 0);
ds_map_add(stats, "weapons_received", []);
ds_map_add(stats, "specials_received", []);
ds_map_add(stats, "ultras_received", []);
ds_map_add(stats, "weapon_default", []);
ds_map_add(stats, "specials_default", []);
ds_map_add(stats, "ultras_default", []);
ds_map_add(stats, "weapon_pellets", 0);
ds_map_add(stats, "special_pellets", 0);
ds_map_add(stats, "ultra_pellets", 0);
ds_map_add(stats, "weapon_lockers_available", []);
ds_map_add(stats, "special_lockers_available", []);
ds_map_add(stats, "ultra_lockers_available", []);
