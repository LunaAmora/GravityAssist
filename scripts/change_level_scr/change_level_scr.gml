n = argument0;

ini_open(working_directory + "config.ini");
	ini_write_real("config", "current_level", n);
ini_close();
room_restart();