planet_color = make_color_hsv((control.coll + control.col  + 128) mod 255, 255, control.hsv_light);

draw_set_color(planet_color)
draw_circle(x, y, sprite_height/2, false)

draw_set_color(c_white);

if (control.edit_mode){
	if ((atmosphereDistance_is_editable && !control.mode_editing) || (gravityDistance_is_editable && control.mode_editing)){
		draw_set_color(c_white);
	}
	else{
		draw_set_color(c_red);
	}
	if (!control.mode_editing){
		if (atmosphere_distance >= sprite_height/2) draw_circle(x, y, atmosphere_distance, true);
	}
	else{
		if (gravity_distance >= sprite_height/2) draw_circle(x, y, gravity_distance, true);
	}
}

draw_set_color(c_white);

if editing == true{
	edit_circle = point_distance(x, y, mouse_x, mouse_y);
	draw_set_color(c_yellow);
	if (!control.mode_editing) && (edit_circle > ((gravity_distance - sprite_width/2)/3) + sprite_width/2) && (gravity_distance > sprite_height/2) && (!global_control.dev_mode){
		draw_circle(x, y, gravity_distance, true);
	}
	else draw_circle(x, y, edit_circle, true);
	draw_set_color(c_white);
}