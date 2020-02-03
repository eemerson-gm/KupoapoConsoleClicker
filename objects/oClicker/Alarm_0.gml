/// @description Clicker - Auto-Save.

//Saves the clicker stats to a file.
ini_open(working_directory + CLICKER_SAVE_FILE);

//Writes the clicker points to the file.
ini_write_real("Clicker", "Points", clicker_points);

//Writes all the upgrades to the file.
for(var u = 0; u < array_length_1d(clicker_upgrades); u++){
	ini_write_real("Upgrades", "Upgrade" + string(u), clicker_upgrades[u]);
}

//Writes the clicker rank and experience.
ini_write_real("Clicker", "Rank", clicker_rank);
ini_write_real("Clicker", "Xp", clicker_xp);

//Writes the sound settings.
ini_write_real("Clicker", "Sound", clicker_sound);
ini_write_real("Clicker", "Music", clicker_music);

//Closes the save file.
ini_close();

//Sets the autosave alarm.
alarm_set(0, CLICKER_SAVE_TIME);