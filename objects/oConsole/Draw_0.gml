/// @description Console - Hovering.

//Gets the hovering value.
var console_h = 1;
console_z = sin(current_time/300) * console_h;

//Hovers the console in the place.
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite(sprite_index, image_index, x, y - (console_h * console_h) - console_z);