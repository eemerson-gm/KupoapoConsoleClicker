/// @description Clicker - Click Every Frame.

//Gets the clicker multiplayer.
var temp_multiplyer = 0;

//Gets the clicker upgrades mulitplyer.
for(var u = 0; u < array_length_1d(clicker_multiplyer); u++){
	
	//Adds the clicker multiplayer upgrades.
	temp_multiplyer += (clicker_multiplyer[u] * clicker_upgrades[u]) * (1 + (floor(clicker_upgrades[u]/10) * CLICKER_UPGRADE_MULTIPLIYER));
	
}

//Sets the clicker speed value.
clicker_speed = (temp_multiplyer * clicker_rank);

//Adds the multiplayer to the points value.
clicker_points += (temp_multiplyer * clicker_rank);

//Checks if music should be playing.
if (clicker_music == true){

	//Checks if audio is playing.
	if (!audio_is_playing(song_roccow_ace_of_clubs) && !audio_is_playing(song_rolemusic_the_white) && !audio_is_playing(song_sawsquarenoise_fire_darer) && !audio_is_playing(song_roccow_and_xyce_de_jongens_met_de_zwarte_schoenenxm1)){
	
		//Selects a random song to play next.
		var new_song = choose(song_roccow_ace_of_clubs, song_rolemusic_the_white, song_sawsquarenoise_fire_darer, song_roccow_and_xyce_de_jongens_met_de_zwarte_schoenenxm1);
	
		//Plays the selected audio.
		audio_play_sound(new_song, 0, false);
	
	}
	
}