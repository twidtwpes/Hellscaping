if(file_exists(SETTINGSFILE) && file_exists(STATSFILE)){
	load_hash();
}else{
	save_settings();
}

if(objSettings_Tracker.settings[? "mute"]) audio_master_gain(0); else audio_master_gain((objSettings_Tracker.settings[? "audio_level"]/10));
window_set_fullscreen(objSettings_Tracker.settings[? "fullscreen"]);
