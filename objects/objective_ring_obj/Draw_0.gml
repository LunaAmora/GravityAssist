if (!passed){
	draw_self();
	draw_set_color(c_yellow)
	
	if (first){
		with(objective_ring_obj){
			if (owner == other.owner){
				draw_line(other.x, other.y, x, y);
			}
		}
	}
}
draw_set_color(c_white);