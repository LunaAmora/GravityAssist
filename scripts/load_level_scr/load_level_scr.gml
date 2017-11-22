level = argument0;

ini_open(working_directory + string(level)+".ini");

number_of_planets = ini_read_real("config", "number_of_planets", 0);
number_of_objectives = ini_read_real("config", "number_of_objectives", 0);

ship_x = ini_read_real("config", "ship_x", 25);
ship_y = ini_read_real("config", "ship_y", room_height/2);
ship_angle = ini_read_real("config", "ship_angle", 0);
ship_impulse = ini_read_real("config", "ship_impulse", 100);

ship = instance_create_layer(ship_x, ship_y, "Ship", spaceship_obj);
ship.phy_rotation = ship_angle;
ship.ship_impulse = ship_impulse

for(i = 0; i < number_of_planets; i++){
	x_pos = ini_read_real(string(i), "x_pos", 0);
	y_pos = ini_read_real(string(i), "y_pos", 0);
	
	new_planet = instance_create_layer(x_pos, y_pos, "Instances", planet_obj);
	new_planet.density = ini_read_real(string(i), "density", 0);
	new_planet.size = ini_read_real(string(i), "size", 0);
	new_planet.gravity_distance = ini_read_real(string(i), "gravity_distance", 0);
	new_planet.atmosphere_distance = ini_read_real(string(i), "atmosphere_distance", 0);
	new_planet.atmosphere_force = ini_read_real(string(i), "atmosphere_velocity", 1000);
	
	new_planet.typeA = ini_read_real(string(i), "typeA", 0);
	new_planet.typeG = ini_read_real(string(i), "typeG", 1);
		
	fix = physics_fixture_create();
	physics_fixture_set_circle_shape(fix, new_planet.size*16);
	physics_fixture_set_density(fix, 0);
	my_fix = physics_fixture_bind(fix, new_planet);
	physics_fixture_delete(fix);
}

for(i = 0; i < number_of_objectives; i++){
	obj_x = ini_read_real("*"+string(i), "obj_x", 0);
	obj_y = ini_read_real("*"+string(i), "obj_y", 0);
	
	obj_new = instance_create_layer(obj_x, obj_y, "Instances", objective_ring_obj);
//	obj_new.angle = ini_read_real("*"+string(i), "angle", 0);
//	obj_new.dist = ini_read_real("*"+string(i), "dist", 0);
}

objective_x = ini_read_real("config", "objective_x", room_width/2);
objective_y = ini_read_real("config", "objective_y", room_height/2);
instance_create_layer(objective_x, objective_y, "Objective", objective_obj);
	
ini_close();

for(v = 0; v < irandom_range(15,30); v++){
	instance_create_layer(irandom(room_width), irandom(room_height), "Stars", star_obj);
}

