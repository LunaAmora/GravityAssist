level = argument0;

ini_open(working_directory + string(level)+".ini");
ini_write_real("config", "number_of_planets", instance_number(planet_obj));
ini_write_real("config", "number_of_objectives", instance_number(objective_ring_obj)/2);
ini_write_real("config", "objective_x", objective_obj.x);
ini_write_real("config", "objective_y", objective_obj.y);
ini_write_real("config", "ship_x", spaceship_obj.x)
ini_write_real("config", "ship_y", spaceship_obj.y)
ini_write_real("config", "ship_angle", spaceship_obj.phy_rotation);
ini_write_real("config", "ship_impulse", spaceship_obj.ship_impulse);


obj_count = 0;

list_planets = ds_list_create();
with(planet_obj){
	ds_list_add(other.list_planets, id);
}

while (!ds_list_empty(list_planets)){
	Planets_id = ds_list_find_value(list_planets, 0);
	ds_list_delete(list_planets, 0);
	
	ini_write_real(string(obj_count), "x_pos", Planets_id.x);
	ini_write_real(string(obj_count), "y_pos", Planets_id.y);
	ini_write_real(string(obj_count), "density", Planets_id.density);
	ini_write_real(string(obj_count), "size", Planets_id.size);
	ini_write_real(string(obj_count), "gravity_distance", Planets_id.gravity_distance);
	ini_write_real(string(obj_count), "atmosphere_distance", Planets_id.atmosphere_distance);
	ini_write_real(string(obj_count), "atmosphere_velocity", Planets_id.atmosphere_force);
	ini_write_real(string(obj_count), "typeG", Planets_id.typeG)
	ini_write_real(string(obj_count), "typeA", Planets_id.typeA)
	obj_count++
}

ds_list_destroy(list_planets);

obj_count = 0;

list_objectives = ds_priority_create();
with(objective_ring_obj){
	if (first) ds_priority_add(other.list_objectives, id, id);
}

while (!ds_priority_empty(list_objectives)){
	objective = ds_priority_delete_min(list_objectives);
	ini_write_real("*"+string(obj_count), "obj_x", objective.x);
	ini_write_real("*"+string(obj_count), "obj_y", objective.y);
	ini_write_real("*"+string(obj_count), "angle", objective.angle);
	ini_write_real("*"+string(obj_count), "dist", objective.dist);
	obj_count++
}

ds_priority_destroy(list_objectives);

ini_close();