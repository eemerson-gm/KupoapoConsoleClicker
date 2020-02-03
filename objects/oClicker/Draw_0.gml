/// @description Clicker - HUD Drawing.

//Draws the text alignment and font.
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Gets the position of the clicker speed text.
var speed_x		= 188;
var speed_y		= 29;

//Draws the clicker speed.
draw_text(speed_x, speed_y, string(floor(clicker_speed*60)) + "p/s");

//Draws the text alignment.
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Gets the position of the points counter.
var points_x	= 8;
var points_y	= 8;
var points_val	= "POINTS " + string(floor(clicker_points));

//Draws the points value string.
draw_text(points_x, points_y, points_val);

//Gets the position of the upgrades.
var upgrades_x	= 26;
var upgrades_y	= 28;
var upgrades_o	= 19;
var upgrades_c	= 5;

//Loops thorugh the list of upgrades.
for(var u = 0; u < upgrades_c; u++){
	
	//Gets the price of the clicker upgrade.
	var upgrades_price			= floor(power(clicker_prices[u] * (clicker_upgrades[u]), CLICKER_PRICE_MULTIPLYER) + clicker_prices[u]);
	var upgrades_able			= (clicker_points >= upgrades_price);
	
	//Draws the button upgrade title.
	draw_text(upgrades_x + 18, upgrades_y + (upgrades_o * u), clicker_names[u] + " (x" + string((1 + (floor(clicker_upgrades[u]/10)  * CLICKER_UPGRADE_MULTIPLIYER))) + ")");
	
	//Draws the button upgrades level and price.
	draw_set_color(color_fix($9EC2E8));
	draw_text(upgrades_x + 18, upgrades_y + 7 + (upgrades_o * u), "LV. " + string(clicker_upgrades[u]) + "  " + string(upgrades_price) + "p");
	draw_set_color(c_white);
	
	//Checks if the button is upgradable.
	var upgrade_sound					= sound_effect_tap_out;
	if (upgrades_able){ upgrade_sound	= sound_effect_bedoop; }
		
	
	//Draws the upgrade button.
	if (scr_button_draw_press(upgrades_x, upgrades_y + (upgrades_o * u), upgrades_able * 2, spr_button_circle, 0, clicker_icons[u], undefined, sound_effect_tap_in, upgrade_sound) && upgrades_able){
		
		//Removes the price from the points balance.
		clicker_points -= upgrades_price;
		
		//Adds the upgrade to the array.
		clicker_upgrades[u]++;
		
	}
	
}

//Draws the clicker ranking.
draw_set_color(color_fix($7664FE));
draw_text(8, 32, "x" + string(clicker_rank));
draw_set_color(c_white);
clicker_xp_prev = lerp(clicker_xp_prev, clicker_xp, 0.1);
draw_health_line(11, 40, 11, 110, 8, (clicker_xp_prev / power(CLICKER_XP_MINIMUM, clicker_rank)), (clicker_xp / power(CLICKER_XP_MINIMUM, clicker_rank)), color_fix($7664FE), color_fix($9EC2E8), color_fix($191028));

//Draws the sound level button.
if scr_button_draw_press(room_width - 16, room_height - 16, 0, spr_button_circle, clicker_sound, spr_icon_sound, undefined, sound_effect_tap_in, sound_effect_tap_out){
	
	//Increases the sound value.
	clicker_sound++;
	
	//Wraps the sound back to zero after maxed.
	clicker_sound = wrap(clicker_sound, 0, 3);
	
	//Sets the sound volume.
	audio_master_gain(clicker_sound/3);
	
}

//Draws the music enable button.
if scr_button_draw_press(room_width - 32, room_height - 16, 0, spr_button_circle, clicker_music, spr_icon_music, ord("M"), sound_effect_tap_in, sound_effect_tap_out){
	
	//Stops all the current audio.
	audio_stop_all();
	
	//Enables or Disables the music.
	clicker_music = !clicker_music;
	
}

//Draws the reset button.
if scr_button_draw_press(4, room_height - 20, 0, spr_button_circle, 0, spr_icon_reset, undefined, sound_effect_tap_in, sound_effect_bedoop){
	
	//Checks if the reset instance already exists.
	if !instance_exists(oReset){
		
		//Creates the reset instances.
		instance_create_layer(0, 0, layer_get_id("Overlay"), oReset);
		
	}
	
}