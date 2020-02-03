
///@param line x1
///@param line y1
///@param line x2
///@param line y2
///@param line width
///@param line percent
///@param line percent-previous
///@param line color
///@param line damage
///@param line background

//Gets the position, percentage and color of the lines.
var line_x1				= argument0;
var line_y1				= argument1;
var line_x2				= argument2;
var line_y2				= argument3;
var line_width			= argument4;
var line_percent		= argument5;
var line_prev_percent	= argument6;
var line_color			= argument7;
var line_damage			= argument8;
var line_background		= argument9;

//Draws the healthbar lines.
draw_set_color(line_background);
draw_line_width(line_x1, line_y1, line_x2, line_y2, line_width);
draw_set_color(line_damage);
draw_line_width(line_x1, line_y2, line_x1, line_y2 - ((line_y2 - line_y1) * line_prev_percent), line_width);
draw_set_color(line_color);
draw_line_width(line_x1, line_y2, line_x1, line_y2 - ((line_y2 - line_y1) * line_percent), line_width);
draw_set_color(c_white);