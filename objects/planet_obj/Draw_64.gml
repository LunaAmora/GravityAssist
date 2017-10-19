draw_set_halign(fa_right);
if ((global_control.dev_mode) && (control.edit_mode) && (place_meeting(x, y, control))){
	draw_text(room_width-15, 30, "Gravity: " + string(typeG+1));
	draw_text(room_width-15, 45, "Atmosphere: " + string(typeA+1));
}
draw_set_halign(fa_left);