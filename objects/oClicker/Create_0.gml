/// @description Clicker - Variables.

//Loads the audio groups.
audio_group_load(audioeffects);
audio_group_load(audiosongs);

//Defines the clicker macros.
#macro CLICKER_SAVE_FILE			"clicker.ini"
#macro CLICKER_SAVE_TIME			2 * room_speed
#macro CLICKER_PRICE_MULTIPLYER		1.3
#macro CLICKER_UPGRADE_MULTIPLIYER	2
#macro CLICKER_XP_MINIMUM			4

//Starts the autosave function.
alarm_set(0, CLICKER_SAVE_TIME);

//Defines the universal clicker points and upgrades.
globalvar clicker_points, clicker_speed, clicker_upgrades, clicker_multiplyer, clicker_icons, clicker_names, clicker_prices, clicker_sound, clicker_music, clicker_rank, clicker_xp, clicker_xp_prev;
////////////////////////////
clicker_points			= 0;
clicker_speed			= 0;
////////////////////////////
clicker_upgrades[0]		= 0;
clicker_upgrades[1]		= 0;
clicker_upgrades[2]		= 0;
clicker_upgrades[3]		= 0;
clicker_upgrades[4]		= 0;
////////////////////////////
clicker_multiplyer[0]	= 0.02;
clicker_multiplyer[1]	= 0.05;
clicker_multiplyer[2]	= 0.10;
clicker_multiplyer[3]	= 0.20;
clicker_multiplyer[4]	= 0.50;
////////////////////////////
clicker_names[0]		= "A Button";
clicker_names[1]		= "B Button";
clicker_names[2]		= "Start Button";
clicker_names[3]		= "Select Button";
clicker_names[4]		= "Super-Charger";
////////////////////////////
clicker_icons[0]		= spr_icon_a_button;
clicker_icons[1]		= spr_icon_b_button;
clicker_icons[2]		= spr_icon_start_button;
clicker_icons[3]		= spr_icon_select_button;
clicker_icons[4]		= spr_icon_supercharger;
////////////////////////////
clicker_prices[0]		= 10;
clicker_prices[1]		= 50;
clicker_prices[2]		= 300;
clicker_prices[3]		= 700;
clicker_prices[4]		= 1200;
////////////////////////////
clicker_sound			= 3;
clicker_music			= true
clicker_rank			= 1;
clicker_xp				= 0;
clicker_xp_prev			= 0;

//Checks if the save file exists.
if file_exists(working_directory + CLICKER_SAVE_FILE){
	
	//Saves the clicker stats to a file.
	ini_open(working_directory + CLICKER_SAVE_FILE);

	//Writes the clicker points to the file.
	clicker_points = ini_read_real("Clicker", "Points", 0);

	//Writes all the upgrades to the file.
	for(var u = 0; u < array_length_1d(clicker_upgrades); u++){
		clicker_upgrades[u] = ini_read_real("Upgrades", "Upgrade" + string(u), 0);
	}
	
	//Reads the clicker rank and experience.
	clicker_rank = ini_read_real("Clicker", "Rank", 1);
	clicker_xp = ini_read_real("Clicker", "Xp", 1);
	
	//Reads the sound settings.
	clicker_sound = ini_read_real("Clicker", "Sound", 3);
	clicker_music = ini_read_real("Clicker", "Music", 1);

	//Closes the save file.
	ini_close();
	
	//Sets the sound gain.
	audio_master_gain(clicker_sound/3);

}