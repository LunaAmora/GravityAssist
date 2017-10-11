if (position_meeting(mouse_x, mouse_y, id)) image_index = 1;
else image_index = 0;

draw_self();

draw_set_color(c_black);
draw_text(x, y, text);
draw_set_color(c_white);