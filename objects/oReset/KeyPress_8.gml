/// @description Reset - Confirm.

//Clears all saved memory.
clicker_points = 0;
for(var u = 0; u < array_length_1d(clicker_upgrades); u++){
	
	//Clears the upgrades.
	clicker_upgrades[u] = 0;
	
}

//Clears the clicker rank and experience.
clicker_rank = 1;
clicker_xp = 0;
clicker_xp_prev = 0;

//Deletes the reset object.
instance_destroy();