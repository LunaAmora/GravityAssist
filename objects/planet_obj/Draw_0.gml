draw_self();

if (!control.edit_mode) || (!control.force_is_active[control.current_level]){
	draw_set_color(c_orange);
}
else{
	draw_set_color(c_white);
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

if (atmosphere_editing){
	draw_text(x, y, string(atmosphere_force));
}
else draw_text(x, y, string(density));


draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);

if (!control.edit_mode) || (!control.distance_is_active[control.current_level]){
	draw_set_color(c_orange);
}
else{
	draw_set_color(c_white);
}

draw_circle(x, y, gravity_distance, true);
draw_set_color(c_purple);
draw_circle(x, y, atmosphere_distance, true);
draw_set_color(c_white);

if editing == true{
	edit_circle = point_distance(x, y, mouse_x, mouse_y);
	draw_set_color(c_yellow);
	draw_circle(x, y, edit_circle, true);
	draw_set_color(c_white);
}