if (level_load[current_level] != true){
	ini_open("levels.ini");
	for(i = 0; i < number_of_planets[current_level]; i++){
		x_pos = ini_read_real(string(current_level)+"_"+string(i), "x_pos", 0);
		y_pos = ini_read_real(string(current_level)+"_"+string(i), "y_pos", 0);
		new_planet = instance_create_layer(x_pos, y_pos, "Instances", planet_obj);
		new_planet.density = ini_read_real(string(current_level)+"_"+string(i), "density", 0);
		new_planet.size = ini_read_real(string(current_level)+"_"+string(i), "size", 0);
		new_planet.gravity_distance = ini_read_real(string(current_level)+"_"+string(i), "gravity_distance", 0);
		new_planet.atmosphere_distance = ini_read_real(string(current_level)+"_"+string(i), "atmosphere_distance", 0);
		new_planet.atmosphere_velocity = ini_read_real(string(current_level)+"_"+string(i), "atmosphere_velocity", 0);
	}
	ini_close();
	level_load[current_level] = true;
}

if keyboard_check_pressed(vk_escape){
	game_end();
}
if keyboard_check_pressed(vk_backspace){
	game_restart();
}