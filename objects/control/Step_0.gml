if (dev_mode){
	if keyboard_check_pressed(vk_enter){
		save_level_scr(current_level);
	}

	if mouse_check_button_pressed(mb_middle){
		creating = true;
	}
}

if keyboard_check_pressed(vk_tab){
	if (dev_mode) dev_mode = false;
	else dev_mode = true;
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



if keyboard_check_pressed(vk_space){
	if ((win) && (!dev_mode)){
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
//if (dev_mode || win){
	if keyboard_check_pressed(vk_right){
		if (current_level < (number_of_levels-1)){
			change_level_scr(current_level + 1);
		}
		else if (dev_mode){
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "number_of_levels", number_of_levels + 1);
			ini_close();
			change_level_scr(current_level + 1);
		}
	}
	if keyboard_check_pressed(vk_left) && current_level > 0{
		change_level_scr(current_level - 1);
	}
//}

if (dev_mode){
	if keyboard_check_pressed(ord("I")){
		instance_create_layer(x, y, "Instances", objective_ring_obj);
	}
}

if (!edit_mode) && (!win){
	time++;
}