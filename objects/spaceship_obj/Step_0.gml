//ilusion_ x = x >= 0 ? x mod room_width: (x + (abs(x) div room_width + 1)*room_width) mod room_width;
//ilusion_ y = y >= 0 ? y mod room_height: (y + (abs(y) div room_height + 1)*room_height) mod room_height;


if (editing){
	phy_rotation = point_direction(x, y, mouse_x, mouse_y);
	if mouse_check_button_released(mb_left){
		editing = false;
	}
}

if (!control.edit_mode) && (!control.win) instance_create_layer(x, y, "SFX1", trail_obj);

if (place_meeting(x, y, objective_obj)){
	control.win = true;
}
if (control.win){
	phy_speed_x *= 0.96;
	phy_speed_y *= 0.96;
	decay = 0.005;
	image_alpha -= decay / 2;
	image_xscale -= decay / 2;
	image_yscale = image_xscale;
	light.new = 0;
	if (image_xscale < 0.1){
		instance_destroy();
		instance_destroy(light);
	}
}

if (control.dev_mode){
	if keyboard_check_pressed(ord("P")){
		reset_scr(mouse_x, mouse_y, control.ship.ship_impulse, control.ship.phy_rotation);
	}

	if place_meeting(x, y, control){
		ship_impulse += mouse_wheel_up() - mouse_wheel_down();
	}
}