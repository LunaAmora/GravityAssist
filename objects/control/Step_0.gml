if (global_control.dev_mode){
	if keyboard_check_pressed(vk_enter){
		save_level_scr(current_level);
	}

	if mouse_check_button_pressed(mb_middle){
		creating = true;
	}
}

if keyboard_check_pressed(vk_tab){
	if (global_control.dev_mode) global_control.dev_mode = false;
	else global_control.dev_mode = true;
}

if (creating == true) && (mouse_check_button_released(mb_middle)){
	m_distance = point_distance(x, y, mouse_x, mouse_y);
	if (m_distance > 1){
		new = instance_create_layer(x, y, "Instances", planet_obj);
	
		if m_distance < 16 m_distance = 16;
	
		new.size = 	m_distance/16;
	
		fix = physics_fixture_create();
		physics_fixture_set_circle_shape(fix, m_distance);
		physics_fixture_set_density(fix, 0);
		my_fix = physics_fixture_bind(fix, new);
		physics_fixture_delete(fix);
	}
	
	creating = false;
}

if !mouse_check_button(mb_middle){
	x = mouse_x;
	y = mouse_y;
}

if (instance_exists(spaceship_obj) && (!global_control.pause)){
	out_timer = ((spaceship_obj.x > 0) && (spaceship_obj.x < room_width) && (spaceship_obj.y > 0) && (spaceship_obj.y < room_height)) ? 0: out_timer+1;
	if ((out_timer div room_speed) == 4){
			reset_scr(ship_x, ship_y, ship.ship_impulse, ship.phy_rotation);
	}
}
else out_timer = 0;

if ((keyboard_check_pressed(vk_space) && (!global_control.pause))) || (change_mode){
	change_mode = false;
	if ((win) && (!global_control.dev_mode)){
		if current_level < (number_of_levels-1){
			change_level_scr(current_level + 1);
		}
	}
	else{
		if (win) win  = (!win);
		if (!edit_mode){
			reset_scr(ship_x, ship_y, instance_exists(spaceship_obj) ? ship.ship_impulse: ship_impulse, instance_exists(spaceship_obj) ? ship.phy_rotation: ship_angle);
			ship.light.new = 0;
		}
		else{
			play_scr();
		
		}
	}
}
if (global_control.dev_mode || win){
	if keyboard_check_pressed(vk_right){
		if (current_level < (number_of_levels-1)){
			change_level_scr(current_level + 1);
		}
		else if (global_control.dev_mode){
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "number_of_levels", number_of_levels + 1);
			ini_close();
			change_level_scr(current_level + 1);
		}
	}
	if keyboard_check_pressed(vk_left) && current_level > 0{
		change_level_scr(current_level - 1);
	}
}

if (global_control.dev_mode){
	if keyboard_check_pressed(ord("I")){
		instance_create_layer(x, y, "Instances", objective_ring_obj);
	}
}

if ((!edit_mode) && (!win) && (!global_control.pause)){
	time++;
}