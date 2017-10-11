if (first){
	if (!created){
		pair = instance_create_layer(x, y, "Instances", objective_ring_obj);
		pair.pair = id;
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
	pair.x = x + cos(degtorad(angle))*dist;
	pair.y = y - sin(degtorad(angle))*dist;
	if collision_line(x, y, pair.x, pair.y, spaceship_obj, false, true){
		passed = true;
	}
}

if place_meeting(x, y, control){
	if (first) angle += (mouse_wheel_up() - mouse_wheel_down())*(1 + keyboard_check(vk_alt)*9);
	if mouse_check_button(mb_middle){
		instance_destroy();
	}
}

