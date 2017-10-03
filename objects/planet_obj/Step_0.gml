image_xscale = size;
image_yscale = size;

switch (typeG){
	case 1: gravityDistance_is_editable = true;
			gravityForce_is_editable = true;
		break; //tudo editável
	case 2: gravityDistance_is_editable = true;
			gravityForce_is_editable = false;
		break; //apenas distancia gravitacional
	case 3: gravityDistance_is_editable = false;
			gravityForce_is_editable = true;
		break; //apenas força gravitacional
	case 0: gravityDistance_is_editable = false;
			gravityForce_is_editable = false;
		break; //nada editável
}
switch (typeA){
	case 1: atmosphereDistance_is_editable = true;
			atmosphereForce_is_editable = true;
		break; //tudo editável
	case 2: atmosphereDistance_is_editable = true;
			atmosphereForce_is_editable = false;
		break; //apenas distancia atmosférica
	case 3: atmosphereDistance_is_editable = false;
			atmosphereForce_is_editable = true;
		break; //apenas força atmosférica
	case 0: atmosphereDistance_is_editable = false;
			atmosphereForce_is_editable = false;
		break; //nada editável
}


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

if (((control.edit_mode)) || (control.dev_mode)) && (place_meeting(x, y, control)){
	if (!mode_editing) && (atmosphereForce_is_editable){
		atmosphere_force += (mouse_wheel_up() - mouse_wheel_down()) * (1 + keyboard_check(vk_alt)*9);;
	}
	else if (gravityForce_is_editable){
		density += (mouse_wheel_up() - mouse_wheel_down()) * (1 + keyboard_check(vk_alt)*9);;
	}
}
if ((control.dev_mode) && (place_meeting(x, y, control))){
	if keyboard_check_pressed(ord("0")) typeG = 0;
	if keyboard_check_pressed(ord("1")) typeG = 1;
	if keyboard_check_pressed(ord("2")) typeG = 2;
	if keyboard_check_pressed(ord("3")) typeG = 3;
	if keyboard_check_pressed(ord("9")) typeA = 0;
	if keyboard_check_pressed(ord("4")) typeA = 1;
	if keyboard_check_pressed(ord("5")) typeA = 2;
	if keyboard_check_pressed(ord("6")) typeA = 3;
}