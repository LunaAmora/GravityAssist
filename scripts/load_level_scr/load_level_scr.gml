level = argument0;

ini_open("levels.ini");
for (i = 0; i < array_length_1d(Planets_id); i++){
	Planets_id[i] = 0;
}
ship_x = ini_read_real(string(level), "ship_x", 0);
ship_y = ini_read_real(string(level), "ship_y", 0);
ship = instance_create_layer(ship_x, ship_y, "Ship", spaceship_obj);
ship.phy_rotation = ini_read_real(string(level), "ship_angle", 0);
ship.ship_impulse = ini_read_real(string(level), "ship_impulse", 0);
	
for(i = 0; i < number_of_planets[level]; i++){
	x_pos = ini_read_real(string(level)+"_"+string(i), "x_pos", 0);
	y_pos = ini_read_real(string(level)+"_"+string(i), "y_pos", 0);
	new_planet = instance_create_layer(x_pos, y_pos, "Instances", planet_obj);
	new_planet.density = ini_read_real(string(level)+"_"+string(i), "density", 0);
	new_planet.size = ini_read_real(string(level)+"_"+string(i), "size", 0);
	new_planet.gravity_distance = ini_read_real(string(level)+"_"+string(i), "gravity_distance", 0);
	new_planet.atmosphere_distance = ini_read_real(string(level)+"_"+string(i), "atmosphere_distance", 0);
	new_planet.atmosphere_velocity = ini_read_real(string(level)+"_"+string(i), "atmosphere_velocity", 1000);
		
	fix = physics_fixture_create();
	physics_fixture_set_circle_shape(fix, new_planet.size*16);
	physics_fixture_set_density(fix, 0);
	my_fix = physics_fixture_bind(fix, new_planet);
	physics_fixture_delete(fix);
}

for(i = 0; i < number_of_objectives[level]; i++){
	obj_x = ini_read_real(string(level)+"*"+string(i), "obj_x", 0);
	obj_y = ini_read_real(string(level)+"*"+string(i), "obj_y", 0);
	obj_new = instance_create_layer(obj_x, obj_y, "Instances", objective_ring_obj);
	obj_new.angle = ini_read_real(string(level)+"*"+string(i), "angle", 0);
	obj_new.dist = ini_read_real(string(level)+"*"+string(i), "dist", 0);
}

objective_x = ini_read_real(string(level), "objective_x", 0);
objective_y = ini_read_real(string(level), "objective_y", 0);
if (objective_x*objective_y != 0) instance_create_layer(objective_x, objective_y, "Objective", objective_obj);
	
ini_close();
