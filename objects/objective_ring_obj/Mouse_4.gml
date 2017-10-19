if (global_control.dev_mode){
	if (first) moving = true;
	else{
		with(objective_ring_obj){
			if (objective_id == other.objective_id){
				moving = true;
			}
		}
	}
}