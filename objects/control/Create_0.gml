current_level = 1;
ini_open("levels.ini");
number_of_levels = ini_read_real("Config", "number_of_levels", 0);
distance_is_active = ini_read_real("Default_state", "distance", 0);
force_is_active = ini_read_real("Default_state", "force", 0);
atmosphere_is_active = ini_read_real("Default_state", "atmosphere", 0);

for (i = 1; i <= number_of_levels; i++){
	number_of_planets[i] = ini_read_real(string(i), "number_of_planets", 0);
}
ini_close();