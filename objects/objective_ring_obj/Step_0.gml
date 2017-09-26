if (first){
	if (!created){
		pair = instance_create_layer(x, y, "Instances", objective_ring_obj);
		pair.objective_id = id;
		pair.first = false;
		pair.created = true;
		created = true;
	}
	if (editing){
		angle = point_direction(x, y, mouse_x, mouse_y);
		dist = point_distance(x, y, mouse_x, mouse_y);
		if mouse_check_button_released(mb_right){
			editing = false;
		}
	}
	if (moving){
		x = mouse_x;
		y = mouse_y;
		if mouse_check_button_released(mb_left){
			moving = false;
		}
	}
}
else{
	with(objective_ring_obj){
		if (other.objective_id == objective_id){
			other.x = x + cos(degtorad(angle))*dist;
			other.y = y - sin(degtorad(angle))*dist;
		}
	}
}
if place_meeting(x, y, control){
	if mouse_check_button(mb_middle){
		with(objective_ring_obj){
			if (objective_id == other.objective_id){
				instance_destroy();
			}
		}
		instance_destroy();
	}
}