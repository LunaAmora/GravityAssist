planet_color = make_color_hsv((control.coll + control.col  + 128) mod 255, 255, control.hsv_light);

draw_set_color(planet_color)
draw_circle(x, y, sprite_height/2, false)
//draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, make_color_hsv((control.coll + control.col  + 128) mod 255,(255),control.hsv_light), image_alpha);
draw_set_color(c_white);

if (!control.edit_mode) || (!gravityForce_is_editable){
	draw_set_color(make_color_hsv((control.coll + control.col) mod 255, 255,control.hsv_light));
}
else{
	draw_set_color(c_white);
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

if (!mode_editing){
	draw_text(x, y, string(atmosphere_force-1000));
}
else draw_text(x, y, string(density));


draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);

if (!control.edit_mode) || (!gravityDistance_is_editable){
	draw_set_color(make_color_hsv((control.coll + control.col + 128) mod 255,(255),control.hsv_light));
}
else{
	draw_set_color(c_white);
}

if (gravity_distance >= sprite_height/2) draw_circle(x, y, gravity_distance, true);
draw_set_color(c_purple);
if (atmosphere_distance >= sprite_height/2) draw_circle(x, y, atmosphere_distance, true);
draw_set_color(c_white);

if editing == true{
	draw_set_circle_precision(8);
	edit_circle = point_distance(x, y, mouse_x, mouse_y);
	draw_set_color(c_yellow);
	if (!mode_editing) && (edit_circle > gravity_distance) && (gravity_distance > sprite_height/2) && (!control.dev_mode){
		draw_circle(x, y, gravity_distance, true);
	}
	else draw_circle(x, y, edit_circle, true);
	draw_set_color(c_white);
	draw_set_circle_precision(32);
}