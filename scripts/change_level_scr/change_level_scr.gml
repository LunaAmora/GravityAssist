n = argument0;

ini_open(working_directory + "config.ini");
	if instance_exists(control){
		if (control.win){
			ini_write_real("progress","progress", current_level+1);
			if (ini_read_real("progress", string(control.current_level), 0) < control.stars+1){
				ini_write_real("progress", string(control.current_level), control.stars+1)
			}
		}
	}
	ini_write_real("config", "current_level", n);
ini_close();
room_restart();