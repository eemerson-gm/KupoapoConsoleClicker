/// @description Reset - Notification.

//Draws the text formatting.
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draws a black screen cover.
draw_set_color(c_black);
draw_set_alpha(0.9);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
draw_set_color(c_white);

//Draws the information text.
draw_text_color(room_width / 2, room_height / 2, "!!! Press Backspace to delete all progress. !!!", color_fix($DC534B), color_fix($DC534B), color_fix($833129), color_fix($833129), 1);
draw_text(room_width / 2, (room_height / 2) + 16, "Press Escape to cancel.");