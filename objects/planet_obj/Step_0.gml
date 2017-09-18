image_xscale = size;
image_yscale = size;
if (instance_exists(spaceship_obj)) && (!control.win){
	
	distance_to_ship = point_distance(x, y, spaceship_obj.x, spaceship_obj.y);
	if (distance_to_ship <= gravity_distance && !control.edit_mode)
	{
		active = true;
		direc_to_ship = point_direction(x, y, spaceship_obj.x, spaceship_obj.y)
		gravity_force = power(sprite_height, 2)* 2.5 * density/power(distance_to_ship, 2);
	
		with (spaceship_obj)
		{
			physics_apply_force(x, y, other.gravity_force * -cos(degtorad(other.direc_to_ship)), other.gravity_force * sin(degtorad(other.direc_to_ship)));
		}
	}
	else active = false;
}

if (editing = true) && mouse_check_button_released(mb_left){
	gravity_distance = point_distance(x, y, mouse_x, mouse_y);
	editing = false;
}
if (((control.force_is_active[control.current_level]) && (control.edit_mode)) || (control.dev_mode)) && (place_meeting(x, y, control)){
	if keyboard_check(vk_shift) multiplyer = 10;
	else multiplyer = 1;
	density += (mouse_wheel_up() - mouse_wheel_down()) * multiplyer;
}
