n = argument0;

ini_open("levels.ini");
	ini_write_real("Config", "current_level", 1);
ini_close();
game_restart();