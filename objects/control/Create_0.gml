col = irandom(255);
coll = 0;
win = false;
creating = false;
edit_mode = true;
dev_mode = false;
time = 0;

window_set_fullscreen(true);

for (i= 0; i < 10; i++){
	Planets_id[i] = 0;
	level_load[i] = false;
}

ini_open("levels.ini");
number_of_levels = ini_read_real("Config", "number_of_levels", 1);
current_level = ini_read_real("Config", "current_level", 0);

for (i = 0; i < number_of_levels; i++){
	number_of_planets[i] = ini_read_real(string(i), "number_of_planets", 0);
	number_of_objectives[i] = ini_read_real(string(i), "number_of_objectives", 0);
}

ini_close();