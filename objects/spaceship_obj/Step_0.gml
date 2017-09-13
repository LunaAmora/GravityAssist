if (editing){
	phy_rotation = point_direction(x, y, mouse_x, mouse_y);
	if mouse_check_button_released(mb_left){
		editing = false;
	}
}

if (!control.edit_mode) instance_create_depth(x, y, 10, trail_obj);

if (place_meeting(x, y, objective_obj)) control.win = true;

if keyboard_check_pressed(ord("P")){
	control.ship_x = mouse_x;
	control.ship_y = mouse_y;
	reset_scr();
}

if place_meeting(x, y, control){
	ship_impulse += mouse_wheel_up() - mouse_wheel_down();
}