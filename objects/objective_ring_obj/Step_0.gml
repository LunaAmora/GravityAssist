if (first){
	with(objective_ring_obj){
		if (owner == other.owner){
			if (!other.passed){
				if collision_line(other.x, other.y, x, y, spaceship_obj, true, true){
					other.passed = true;
				}
			}
		}
	}
}