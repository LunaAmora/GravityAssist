if ((active) && (instance_exists(spaceship_obj))){	//Código da gravidade aqui
	distance_to_ship = point_distance(x, y, spaceship_obj.x, spaceship_obj.y);
	direc_to_ship = point_direction(x, y, spaceship_obj.x, spaceship_obj.y)
	gravity_force = power(sprite_height, 2)* 2.5 * density/power(distance_to_ship, 2);
	physics_apply_force(x, y, gravity_force * cos(degtorad(direc_to_ship)), gravity_force * -sin(degtorad(direc_to_ship)));
}