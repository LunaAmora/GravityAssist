n = argument0;

ini_open(working_directory + "config.ini");
	if instance_exists(control){
		if (control.win){
			ini_write_real("progress","progress", current_level+1);
			a_n = 0;
			ob_n = 0;
			if instance_exists(objective_ring_obj){
				ob_n = instance_number(objective_ring_obj);
				while (instance_exists(objective_ring_obj)){
					if (instance_nearest(x, y, objective_ring_obj).passed == true){
						a_n++
					}
					instance_destroy(instance_nearest(x, y, objective_ring_obj))
				}
			}
			if (a_n == ob_n || ob_n == 0) obj_progress = 1;
			else obj_progress = 0;
			
			total_progress = obj_progress + 2;
			if (ini_read_real("progress", string(control.current_level), 0) < total_progress){
				ini_write_real("progress", string(control.current_level), total_progress)
			}
		}
	}
	ini_write_real("config", "current_level", n);
ini_close();
room_restart();