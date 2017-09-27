image_xscale = size;
image_yscale = size;


if keyboard_check_pressed(vk_control) mode_editing = (!mode_editing);

if (instance_exists(spaceship_obj)) && (!control.win){
	
	distance_to_ship = point_distance(x, y, spaceship_obj.x, spaceship_obj.y);
	
	if (distance_to_ship <= gravity_distance && !control.edit_mode)
	{
		direc_to_ship = point_direction(x, y, spaceship_obj.x, spaceship_obj.y)
		gravity_force = power(sprite_height, 2)* 2.5 * density/power(distance_to_ship, 2);
	
		with (spaceship_obj)
		{
			physics_apply_force(x, y, other.gravity_force * -cos(degtorad(other.direc_to_ship)), other.gravity_force * sin(degtorad(other.direc_to_ship)));
		}
	}
	
	if (distance_to_ship <= atmosphere_distance && !control.edit_mode)
	{
		with (spaceship_obj)
		{
				phy_speed_x *= other.atmosphere_force/1000;
				phy_speed_y *= other.atmosphere_force/1000;
		}
	}
}

if (editing = true) && mouse_check_button_released(mb_left){
	if (!mode_editing){
		if (point_distance(x, y, mouse_x, mouse_y) <= gravity_distance) || (control.dev_mode) || (gravity_distance < sprite_height/2){
			atmosphere_distance = point_distance(x, y, mouse_x, mouse_y);
		}
		else atmosphere_distance = gravity_distance;
	}
	else gravity_distance = point_distance(x, y, mouse_x, mouse_y);
	editing = false;
}

if (((control.force_is_active[control.current_level]) && (control.edit_mode)) || (control.dev_mode)) && (place_meeting(x, y, control)){
	if (!mode_editing){
		atmosphere_force += (mouse_wheel_up() - mouse_wheel_down()) * (1 + keyboard_check(vk_alt)*9);;
	}
	else density += (mouse_wheel_up() - mouse_wheel_down()) * (1 + keyboard_check(vk_alt)*9);;
}