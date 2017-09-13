level = argument0;

ini_open("levels.ini");
ini_write_real(string(level), "number_of_planets", instance_number(planet_obj));
ini_write_real(string(level), "objective_x", objective_obj.x);
ini_write_real(string(level), "objective_y", objective_obj.y);
ini_write_real(string(level), "ship_x", spaceship_obj.x)
ini_write_real(string(level), "ship_y", spaceship_obj.y)
ini_write_real(string(level), "ship_angle", spaceship_obj.phy_rotation);
ini_write_real(string(level), "ship_impulse", spaceship_obj.ship_impulse);
for (a = 0; a < instance_number(planet_obj); a ++){
	for (i = 0; i < array_length_1d(Planets_id); i++){
		if (Planets_id[i] == instance_find(planet_obj, a)){
			ini_write_real(string(level)+"_"+string(i), "x_pos", Planets_id[i].x);
			ini_write_real(string(level)+"_"+string(i), "y_pos", Planets_id[i].y);
			ini_write_real(string(level)+"_"+string(i), "density", Planets_id[i].density);
			ini_write_real(string(level)+"_"+string(i), "size", Planets_id[i].size);
			ini_write_real(string(level)+"_"+string(i), "gravity_distance", Planets_id[i].gravity_distance);
			ini_write_real(string(level)+"_"+string(i), "atmosphere_distance", Planets_id[i].atmosphere_distance);
			ini_write_real(string(level)+"_"+string(i), "atmosphere_velocity", Planets_id[i].atmosphere_velocity);
		}
	}

}
ini_close();