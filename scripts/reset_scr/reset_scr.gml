a = argument0;
b = argument1;

with (spaceship_obj){
	instance_destroy();
}

ini_open("levels.ini")
if (a == 0){
	control.ship_x = ini_read_real(string(control.current_level), "ship_x", 0);
}
else control.ship_x = a;

if (b == 0){
	control.ship_y = ini_read_real(string(control.current_level), "ship_y", 0);
}
else control.ship_y = b;

with(control){
	ship = instance_create_layer(ship_x, ship_y, "Ship", spaceship_obj);
	ship.phy_rotation = ini_read_real(string(current_level), "ship_angle", 0);
	ship.ship_impulse = ini_read_real(string(current_level), "ship_impulse", 0);
	ini_close();
}

with(trail_obj) instance_destroy();

control.edit_mode = true;

if instance_exists(objective_ring_obj){
	with(objective_ring_obj){
		passed = false;
	}
}
control.time = 0;