win = false;
creating = false;
edit_mode = true;
dev_mode = false;

for (i= 0; i < 10; i++){
	Planets_id[i] = 0;
	level_load[i] = false;
}

ini_open("levels.ini");
number_of_levels = ini_read_real("Config", "number_of_levels", 1);
current_level = ini_read_real("Config", "current_level", 0);

for (i = 0; i < number_of_levels; i++){
	distance_is_active[i] = ini_read_real(string(i), "distance_is_active", 1);
	force_is_active[i] = ini_read_real(string(i), "force_is_active", 0);
	atmosphere_is_active[i] = ini_read_real(string(i), "atmosphere_is_active", 0);
	number_of_planets[i] = ini_read_real(string(i), "number_of_planets", 0);
}

ini_close();