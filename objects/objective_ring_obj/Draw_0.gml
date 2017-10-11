if (!passed){
	draw_self();
	if (first){
		with(objective_ring_obj){
			if (objective_id == other.objective_id){
				draw_line(other.x, other.y, x, y);
			}
		}
	}
}
draw_set_color(c_white);