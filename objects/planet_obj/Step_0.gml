image_xscale = size;
image_yscale = size;
if (has_ring){
	if (!ring_created){
		ring_a = instance_create_layer(x + cos(degtorad(ring_pos))*sprite_height/2, y - sin(degtorad(ring_pos))*sprite_height/2, "Instances", objective_ring_obj);
		ring_b = instance_create_layer(x + cos(degtorad(ring_pos))*gravity_distance, y - sin(degtorad(ring_pos))*gravity_distance, "Instances", objective_ring_obj);
		ring_a.owner = id;
		ring_a.first = true;
		ring_b.owner = id;
		ring_created = true;
	}
}
atmosphere_editing = keyboard_check(vk_control);

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
	if (atmosphere_editing){
		atmosphere_distance = point_distance(x, y, mouse_x, mouse_y);
	}
	else gravity_distance = point_distance(x, y, mouse_x, mouse_y);
	editing = false;
}
if (((control.force_is_active[control.current_level]) && (control.edit_mode)) || (control.dev_mode)) && (place_meeting(x, y, control)){
	if keyboard_check(vk_shift) multiplyer = 10;
	else multiplyer = 1;
	if (atmosphere_editing){
		atmosphere_force += (mouse_wheel_up() - mouse_wheel_down()) * multiplyer;
	}
	else density += (mouse_wheel_up() - mouse_wheel_down()) * multiplyer;
}
