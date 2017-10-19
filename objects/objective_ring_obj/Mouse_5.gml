if (global_control.dev_mode){
	if (first) editing = true;
	else{
		with(objective_ring_obj){
			if (objective_id == other.objective_id){
				editing = true;
			}
		}
	}
}
