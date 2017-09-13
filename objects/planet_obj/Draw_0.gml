draw_self();
draw_circle(x, y, gravity_distance, true);
if editing == true{
	edit_circle = point_distance(x, y, mouse_x, mouse_y);
	draw_set_color(c_yellow);
	draw_circle(x, y, edit_circle, true);
	draw_set_color(c_white);
}