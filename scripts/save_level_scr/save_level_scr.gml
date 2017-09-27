level = argument0;

ini_open("levels.ini");
ini_write_real(string(level), "number_of_planets", instance_number(planet_obj));
ini_write_real(string(level), "objective_x", objective_obj.x);
ini_write_real(string(level), "objective_y", objective_obj.y);
ini_write_real(string(level), "ship_x", spaceship_obj.x)
ini_write_real(string(level), "ship_y", spaceship_obj.y)
ini_write_real(string(level), "ship_angle", spaceship_obj.phy_rotation);
ini_write_real(string(level), "ship_impulse", spaceship_obj.ship_impulse);

for (a = 0; a < instance_number(planet_obj); a++){
	for (i = 0; i < array_length_1d(Planets_id); i++){
		if (Planets_id[i] == instance_find(planet_obj, a)){
			ini_write_real(string(level)+"_"+string(a), "x_pos", Planets_id[i].x);
			ini_write_real(string(level)+"_"+string(a), "y_pos", Planets_id[i].y);
			ini_write_real(string(level)+"_"+string(a), "density", Planets_id[i].density);
			ini_write_real(string(level)+"_"+string(a), "size", Planets_id[i].size);
			ini_write_real(string(level)+"_"+string(a), "gravity_distance", Planets_id[i].gravity_distance);
			ini_write_real(string(level)+"_"+string(a), "atmosphere_distance", Planets_id[i].atmosphere_distance);
			ini_write_real(string(level)+"_"+string(a), "atmosphere_velocity", Planets_id[i].atmosphere_force);
		}
	}
}

obj_count = 0;
ini_write_real(string(level), "number_of_objectives", instance_number(objective_ring_obj)/2);

list_objectives = ds_priority_create();
with(objective_ring_obj){
	if (first) ds_priority_add(other.list_objectives, id, id);
}
while (!ds_priority_empty(list_objectives)){
	objective = ds_priority_delete_min(list_objectives);
	ini_write_real(string(level)+"*"+string(obj_count), "obj_x", objective.x);
	ini_write_real(string(level)+"*"+string(obj_count), "obj_y", objective.y);
	ini_write_real(string(level)+"*"+string(obj_count), "angle", objective.angle);
	ini_write_real(string(level)+"*"+string(obj_count), "dist", objective.dist);
	obj_count++
}

ini_close();