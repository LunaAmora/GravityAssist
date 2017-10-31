draw_set_halign(fa_right);
if ((global_control.dev_mode) && (control.edit_mode) && (place_meeting(x, y, control))){
	draw_text(room_width-15, 30, "Gravity: " + string(typeG+1));
	draw_text(room_width-15, 45, "Atmosphere: " + string(typeA+1));
}
draw_set_halign(fa_left);

if (control.edit_mode){
	if ((atmosphereForce_is_editable && !mode_editing) || (gravityForce_is_editable && mode_editing)){
		draw_set_color(c_ltgray);
	}
	else{
		draw_set_color(c_black);
	}
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);

	if (!mode_editing){
		draw_text(x, y, string(atmosphere_force-1000));
	}
	else draw_text(x, y, string(density));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
draw_set_color(c_white);