if (level_load[current_level] != true){ 
	load_level_scr(current_level);
	level_load[current_level] = true;
}

if keyboard_check_pressed(vk_enter){
	save_level_scr(current_level);
}

if mouse_check_button_pressed(mb_middle){
	creating = true;
}

if (creating == true) && (mouse_check_button_released(mb_middle)){
	m_distance = point_distance(x, y, mouse_x, mouse_y);
	new = instance_create_layer(x, y, "Instances", planet_obj);
		
	if m_distance < 16 m_distance = 16;
	
	new.size = 	m_distance/16;
	
	fix = physics_fixture_create();
	physics_fixture_set_circle_shape(fix, m_distance);
	physics_fixture_set_density(fix, 0);
	my_fix = physics_fixture_bind(fix, new);
	physics_fixture_delete(fix);
	
	creating = false;
}

if !mouse_check_button(mb_middle){
	x = mouse_x;
	y = mouse_y;
}

if keyboard_check_pressed(vk_escape){
	game_end();
}

if keyboard_check_pressed(vk_space){
	if (!reseted){
		reset_scr();
		reseted = true;
	}
	else{
		play_scr();
		reseted = false;
		
	}
}

if keyboard_check_pressed(vk_right) && current_level < (number_of_levels-1){
	change_level_scr(current_level + 1);
}
if keyboard_check_pressed(vk_left) && current_level > 0{
	change_level_scr(current_level - 1);
}

if keyboard_check_pressed(vk_backspace){
	game_restart();
}
