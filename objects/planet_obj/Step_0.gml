image_xscale = size;
image_yscale = size;

switch (typeG){
	case 0: gravityDistance_is_editable = false;
			gravityForce_is_editable = false;
		break; //nada editável
	case 1: gravityDistance_is_editable = true;
			gravityForce_is_editable = true;
		break; //tudo editável
	case 2: gravityDistance_is_editable = true;
			gravityForce_is_editable = false;
		break; //apenas distancia gravitacional
	case 3: gravityDistance_is_editable = false;
			gravityForce_is_editable = true;
		break; //apenas força gravitacional
}
switch (typeA){
	case 0: atmosphereDistance_is_editable = false;
			atmosphereForce_is_editable = false;
		break; //nada editável
	case 1: atmosphereDistance_is_editable = true;
			atmosphereForce_is_editable = true;
		break; //tudo editável
	case 2: atmosphereDistance_is_editable = true;
			atmosphereForce_is_editable = false;
		break; //apenas distancia atmosférica
	case 3: atmosphereDistance_is_editable = false;
			atmosphereForce_is_editable = true;
		break; //apenas força atmosférica
}

with (physics_parent)
{
	with (other)
	{
		target = other;
		
		if (!control.win) {
	
			distance_to_ship = point_distance(x, y, target.x, target.y);
	
			if (distance_to_ship <= gravity_distance && (!control.edit_mode || (!target.is_ship)))
			{
				direc_to_ship = point_direction(x, y, target.x, target.y)
				gravity_force = power(sprite_height, 2)* 2.5 * density/power(distance_to_ship, 2);
				if (!target.is_ship) gravity_force = 40;
	
				with (target)
				{
					physics_apply_force(x, y, other.gravity_force * -cos(degtorad(other.direc_to_ship)), other.gravity_force * sin(degtorad(other.direc_to_ship)));
				}
			}
	
			if (distance_to_ship <= atmosphere_distance && !control.edit_mode)
			{
				with (target)
				{
					phy_speed_x *= (1000 - (other.atmosphere_force-1000))/1000;
					phy_speed_y *= (1000 - (other.atmosphere_force-1000))/1000;
				}
			}
		}
	}
}

if (editing = true) && mouse_check_button_released(mb_left){
	/*if (!control.mode_editing){
		if (point_distance(x, y, mouse_x, mouse_y) <= gravity_distance) || (global_control.dev_mode) || (gravity_distance < sprite_height/2){
			atmosphere_distance = point_distance(x, y, mouse_x, mouse_y);
			
		}
		else atmosphere_distance = gravity_distance;
	}
	else{*/
	gravity_distance = point_distance(x, y, mouse_x, mouse_y);
	light.new = 0;
	atm.clouds = 0;
	atm.reach = 0;
	//}
	editing = false;
}

if ((control.edit_mode) && (place_meeting(x, y, control))){
	if (!control.mode_editing){
		if ((atmosphereForce_is_editable && atmosphere_force >= 1001 && atmosphere_force <= 1010) || (global_control.dev_mode)){
			atmosphere_force += (mouse_wheel_up() - mouse_wheel_down()) * (1 + keyboard_check(vk_shift)*9);
			if (atmosphere_force < 1001 && !global_control.dev_mode) atmosphere_force = 1001;
			if (atmosphere_force > 1010 && !global_control.dev_mode) atmosphere_force = 1010;
		}
	}
	else if (gravityForce_is_editable && density >= 0|| (global_control.dev_mode)){
		density += (mouse_wheel_up() - mouse_wheel_down()) * (1 + keyboard_check(vk_shift)*9);
		if (density < 0 && !global_control.dev_mode) density = 0;
	}
}
if ((global_control.dev_mode) && (place_meeting(x, y, control))){
	if (control.mode_editing){
		if keyboard_check_pressed(ord("1")) typeG = 0;
		if keyboard_check_pressed(ord("2")) typeG = 1;
		if keyboard_check_pressed(ord("3")) typeG = 2;
		if keyboard_check_pressed(ord("4")) typeG = 3;
	}
	else{
		if keyboard_check_pressed(ord("1")) typeA = 0;
		if keyboard_check_pressed(ord("2")) typeA = 1;
		if keyboard_check_pressed(ord("3")) typeA = 2;
		if keyboard_check_pressed(ord("4")) typeA = 3;
	}
}

if ((atmosphere_force > 1000)){
	atmosphere_distance = round((gravity_distance + sprite_width)/3)
}
else if (atmosphere_distance != 0){
	atmosphere_distance = 0;
	atm.clouds = 0;
	atm.reach = 0;
}