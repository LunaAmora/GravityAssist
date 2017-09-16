if (default_rot == -1){
	default_rot = phy_rotation;
}
else phy_rotation = default_rot;
if (editing){
	phy_rotation = point_direction(x, y, mouse_x, mouse_y);
	if mouse_check_button_released(mb_left){
		editing = false;
	}
}

if (!control.edit_mode) && (!control.win) instance_create_depth(x, y, 10, trail_obj);

if (place_meeting(x, y, objective_obj)){
	control.win = true;
	phy_speed_x *= 0.96;
	phy_speed_y *= 0.96;
	decay = 0.005;
	image_alpha -= decay / 2;
	image_xscale -= decay / 2;
	image_yscale = image_xscale;
}

if (control.dev_mode){
	if keyboard_check_pressed(ord("P")){
		control.ship_x = mouse_x;
		control.ship_y = mouse_y;
		reset_scr();
	}

	if place_meeting(x, y, control){
		ship_impulse += mouse_wheel_up() - mouse_wheel_down();
	}
}