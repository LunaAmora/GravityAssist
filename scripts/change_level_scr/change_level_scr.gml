n = argument0;

ini_open("levels.ini");
	ini_write_real("Config", "current_level", n);
ini_close();
room_restart();