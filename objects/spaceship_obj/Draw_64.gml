if (control.dev_mode) {
	draw_text(15, 30, "Velocity: " + string(phy_rotation));
}
if ((control.dev_mode) && (control.edit_mode) && (place_meeting(x, y, control))){
	draw_text(15, 45, "Impulse: " + string(ship_impulse));
}